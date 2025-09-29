/** QRDepositModal.secure.jsx **/
import { useEffect, useState } from "react";

/**
 * Client-side encrypted deposit modal.
 *
 * WARNING: This only obfuscates/ encrypts addresses in browser storage.
 * It is NOT a substitute for server-issued addresses for real money flows.
 */

/* --- Demo/static addresses (you provided these) --- */
const addresses = {
  Bitcoin: "bc1qxy2kgdygjrsqtzq2n0yrf2493p83kkfjhx0wlh",
  "Tether(TRC20)": "TDv3hTbQTc5f6Mt59nMHtPXt8mkaqvBEDw",
  "Tether(ERC20)": "0x742d35Cc6634C0532925a3b844Bc454e4438f44e",
  "Bank Transfer 1": "Account No: 1234567890 (Bank XYZ)",
  Palmpay: "Palmpay ID: 1122334455",
};

/* --- Helpers: base64 / array buffer conversions --- */
const bufToB64 = (buf) => {
  const bytes = new Uint8Array(buf);
  let binary = "";
  for (let i = 0; i < bytes.byteLength; i++) binary += String.fromCharCode(bytes[i]);
  return btoa(binary);
};
const b64ToBuf = (b64) => {
  const binary = atob(b64);
  const len = binary.length;
  const bytes = new Uint8Array(len);
  for (let i = 0; i < len; i++) bytes[i] = binary.charCodeAt(i);
  return bytes.buffer;
};

/* --- Crypto primitives (WebCrypto) --- */
async function deriveKey(passphrase, salt, iterations = 150_000) {
  const enc = new TextEncoder();
  const baseKey = await crypto.subtle.importKey("raw", enc.encode(passphrase), "PBKDF2", false, ["deriveKey"]);
  const key = await crypto.subtle.deriveKey(
    { name: "PBKDF2", salt, iterations, hash: "SHA-256" },
    baseKey,
    { name: "AES-GCM", length: 256 },
    false,
    ["encrypt", "decrypt"]
  );
  return key;
}

async function encryptJson(obj, passphrase) {
  const salt = crypto.getRandomValues(new Uint8Array(16));
  const iv = crypto.getRandomValues(new Uint8Array(12));
  const key = await deriveKey(passphrase, salt);
  const enc = new TextEncoder();
  const plaintext = enc.encode(JSON.stringify(obj));
  const ciphertext = await crypto.subtle.encrypt({ name: "AES-GCM", iv }, key, plaintext);

  return {
    salt: bufToB64(salt.buffer),
    iv: bufToB64(iv.buffer),
    ciphertext: bufToB64(ciphertext),
    createdAt: new Date().toISOString(),
  };
}

async function decryptJson(payload, passphrase) {
  const saltBuf = b64ToBuf(payload.salt);
  const ivBuf = b64ToBuf(payload.iv);
  const cipherBuf = b64ToBuf(payload.ciphertext);
  const key = await deriveKey(passphrase, new Uint8Array(saltBuf));
  const plaintextBuf = await crypto.subtle.decrypt({ name: "AES-GCM", iv: new Uint8Array(ivBuf) }, key, cipherBuf);
  const dec = new TextDecoder();
  return JSON.parse(dec.decode(plaintextBuf));
}

/* --- Storage key --- */
const STORAGE_KEY = "encrypted_deposit_addresses_v1";

/* --- Component --- */
export default function QRDepositModal({ method, amount, onBack, onClose }) {
  // UI state
  const [copied, setCopied] = useState(false);
  const [passphrase, setPassphrase] = useState("");
  const [loading, setLoading] = useState(false);
  const [savedPayload, setSavedPayload] = useState(null); // decrypted payload meta
  const [unlockedAddress, setUnlockedAddress] = useState(null);
  const [error, setError] = useState("");

  // Derived values
  const methodName = method?.name || "unknown";
  const plaintextAddress = addresses[methodName] ?? "Address not available";

  // On mount: check if there is a saved encrypted payload for this method
  useEffect(() => {
    try {
      const raw = localStorage.getItem(STORAGE_KEY);
      if (!raw) {
        setSavedPayload(null);
        return;
      }
      const store = JSON.parse(raw); // store is { [methodName]: payload, ... }
      const payload = store[methodName] || null;
      setSavedPayload(payload);
    } catch (err) {
      console.error("Failed to read storage", err);
      setSavedPayload(null);
    }
    // reset unlocked address / errors when switching method
    setUnlockedAddress(null);
    setError("");
    setPassphrase("");
  }, [methodName]);

  // Copy handler (copies unlockedAddress or plaintext if unlockedAddress missing)
  const handleCopy = async () => {
    try {
      const addr = unlockedAddress || plaintextAddress;
      await navigator.clipboard.writeText(addr);
      setCopied(true);
      setTimeout(() => setCopied(false), 1500);
    } catch (err) {
      console.error("Failed to copy:", err);
      setError("Copy failed. Make sure clipboard is available.");
    }
  };

  // Save (encrypt & store) current plaintextAddress for this method
  const handleSaveEncrypted = async () => {
    setError("");
    if (!passphrase) {
      setError("Enter a passphrase to encrypt the address.");
      return;
    }
    setLoading(true);
    try {
      // Build payload (you can add whatever metadata you want)
      const payloadObj = {
        method: methodName,
        address: plaintextAddress,
        savedAt: new Date().toISOString(),
      };
      const enc = await encryptJson(payloadObj, passphrase);

      // store under STORAGE_KEY as an object per method
      const raw = localStorage.getItem(STORAGE_KEY);
      const store = raw ? JSON.parse(raw) : {};
      store[methodName] = enc;
      localStorage.setItem(STORAGE_KEY, JSON.stringify(store));
      setSavedPayload(enc);
      setUnlockedAddress(null);
      setError("");
    } catch (err) {
      console.error("Encryption failed:", err);
      setError("Encryption failed. Try a different passphrase.");
    } finally {
      setLoading(false);
    }
  };

  // Unlock (decrypt) saved payload using passphrase
  const handleUnlock = async () => {
    setError("");
    if (!savedPayload) {
      setError("No saved encrypted address for this method.");
      return;
    }
    if (!passphrase) {
      setError("Enter your passphrase to unlock.");
      return;
    }
    setLoading(true);
    try {
      const obj = await decryptJson(savedPayload, passphrase);
      // obj should contain { method, address, savedAt }
      if (!obj.address) throw new Error("Malformed payload");
      setUnlockedAddress(obj.address);
      setError("");
    } catch (err) {
      console.error("Decryption failed:", err);
      setError("Decryption failed. Wrong passphrase or tampered data.");
      setUnlockedAddress(null);
    } finally {
      setLoading(false);
    }
  };

  // Clear saved encrypted payload for this method
  const handleClearSaved = () => {
    try {
      const raw = localStorage.getItem(STORAGE_KEY);
      if (!raw) return;
      const store = JSON.parse(raw);
      delete store[methodName];
      localStorage.setItem(STORAGE_KEY, JSON.stringify(store));
      setSavedPayload(null);
      setUnlockedAddress(null);
      setPassphrase("");
      setError("");
    } catch (err) {
      console.error("Failed to clear saved payload", err);
      setError("Failed to clear local storage.");
    }
  };

  // Compute the address to display: prefer unlockedAddress, else if no saved payload show plaintext
  const displayedAddress = unlockedAddress ?? (savedPayload ? "****** (unlock to view)" : plaintextAddress);

  // QR url (encode)
  const qrUrl = (addr) =>
    addr && (addr !== "****** (unlock to view)")
      ? `https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=${encodeURIComponent(addr)}`
      : null;

  return (
    <div className="fixed inset-0 z-50">
      {/* Backdrop */}
      <div className="absolute inset-0 bg-black/50 backdrop-blur-sm" onClick={onClose} />

      {/* Modal */}
      <div className="relative z-10 flex items-center justify-center p-4 w-full h-full">
        <div className="bg-lightbg dark:bg-primary w-full h-full md:max-w-lg md:h-auto md:rounded-2xl shadow-lg flex flex-col">
          {/* Header */}
          <div className="flex justify-between items-center p-4 border-b border-gray-700">
            <button onClick={onBack} aria-label="Back">←</button>
            <h2 className="font-semibold">Deposit</h2>
            <button onClick={onClose} aria-label="Close">✕</button>
          </div>

          {/* Content */}
          <div className="flex-1 overflow-y-auto p-4 space-y-6">
            <div className="bg-lightbg dark:bg-primary p-4 rounded-lg">
              <h3 className="text-lg font-semibold">Deposit Amount</h3>
              <p className="text-2xl font-bold">{amount ?? "—"} USD</p>
              <p className="text-sm mt-2">Order: {Date.now()}</p>
            </div>

            <div className="bg-lightbg dark:bg-primary p-4 rounded-lg">
              <p className="text-sm text-gray-400 mb-2">Payment Method</p>
              <p>{methodName}</p>
            </div>

            <div className="bg-lightbg dark:bg-primary p-4 rounded-lg text-center">
              {/* QR only if crypto */}
              {(methodName?.includes("Bitcoin") || methodName?.includes("Tether")) && displayedAddress && displayedAddress !== "****** (unlock to view)" ? (
                <img src={qrUrl(displayedAddress)} alt="QR Code" className="mx-auto mb-3" />
              ) : null}

              <p className="font-mono break-words mb-3">{displayedAddress}</p>

              {/* If we have a saved encrypted payload: show Unlock UI else show Save UI */}
              {savedPayload ? (
                <>
                  <div className="flex items-center justify-center gap-2 mb-2">
                    <input
                      type="password"
                      placeholder="Passphrase to unlock"
                      value={passphrase}
                      onChange={(e) => setPassphrase(e.target.value)}
                      className="px-3 py-2 rounded-lg border border-gray-200 dark:border-gray-700"
                    />
                    <button
                      onClick={handleUnlock}
                      className="bg-secondary text-white px-3 py-2 rounded-lg"
                      disabled={loading}
                    >
                      {loading ? "Unlocking..." : "Unlock"}
                    </button>
                    <button onClick={handleClearSaved} className="px-3 py-2 rounded-lg border">
                      Clear
                    </button>
                  </div>
                  <div className="text-xs text-gray-400 mb-2">Saved encrypted on this device at {savedPayload?.createdAt ?? "unknown"}</div>
                </>
              ) : (
                <>
                  <div className="flex items-center justify-center gap-2 mb-2">
                    <input
                      type="password"
                      placeholder="Choose a passphrase to encrypt & save"
                      value={passphrase}
                      onChange={(e) => setPassphrase(e.target.value)}
                      className="px-3 py-2 rounded-lg border border-gray-200 dark:border-gray-700"
                    />
                    <button onClick={handleSaveEncrypted} className="bg-secondary text-white px-3 py-2 rounded-lg" disabled={loading}>
                      {loading ? "Saving..." : "Encrypt & Save"}
                    </button>
                  </div>
                  <div className="text-xs text-gray-400 mb-2">Or just use the address shown (not saved).</div>
                </>
              )}

              <button className="mt-2 bg-secondary px-4 py-1 rounded-full" onClick={handleCopy}>
                {copied ? "Copied!" : "Copy"}
              </button>

              {error ? <div className="text-sm text-red-400 mt-2">{error}</div> : null}
              {savedPayload && !unlockedAddress ? <div className="text-xs text-yellow-400 mt-2">Address is encrypted—unlock to view QR and full address.</div> : null}
            </div>

            <div className="text-sm bg-lightbg dark:bg-primary p-3 rounded-lg text-gray-500">
              • Only deposit {methodName} to this address. Other tokens will be lost.
            </div>
          </div>

          {/* Footer */}
          <div className="p-4 border-t border-gray-700 flex gap-3">
            <button className="flex-1 border border-secondary py-2 rounded-lg">Save QR</button>
            <button className="flex-[2] bg-secondary text-white py-2 rounded-lg">Open Wallet</button>
          </div>
        </div>
      </div>
    </div>
  );
}
