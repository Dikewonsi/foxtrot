
import { useEffect, useState, useRef } from "react";
import { motion, AnimatePresence } from "framer-motion";
import { User, Mail, Lock, Eye, EyeOff, Phone } from "lucide-react";
import ThemeToggle from "../components/ThemeToggle";
import { useNavigate } from "react-router-dom";

/**
 * Multi-step RegisterPage
 * - Step 1: basics + phone + country (fetched from restcountries)
 * - Step 2: wallet + trading history + highest investment + agree + submit
 * - Uses cookie-based flow helper `ensureSanctumAndRegister` (Sanctum) — replace if you use tokens
 */

export default function RegisterPage() {
  const navigate = useNavigate();

  // step control
  const [step, setStep] = useState(1);

  // Step fields
  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");
  const [email, setEmail] = useState("");
  const [phone, setPhone] = useState("");
  const [country, setCountry] = useState("");

  // passwords
  const [password, setPassword] = useState("");
  const [confirm, setConfirm] = useState("");
  const [showPassword, setShowPassword] = useState(false);

  // step 2 fields
  const [preferredWallet, setPreferredWallet] = useState(""); // e.g., Trust Wallet, Metamask, etc.
  const [cryptoWalletName, setCryptoWalletName] = useState(""); // free text
  const [tradedBefore, setTradedBefore] = useState(null); // "yes" | "no" | null
  const [highestInvestment, setHighestInvestment] = useState(""); // number/string

  // UI & state
  const [loading, setLoading] = useState(false);
  const [countries, setCountries] = useState([]); // { name, code }
  const [errors, setErrors] = useState({});
  const [flash, setFlash] = useState("");

  const mountedRef = useRef(true);
  useEffect(() => () => { mountedRef.current = false; }, []);

  // password strength helper
  function passwordStrengthScore(pw) {
    let s = 0;
    if (pw.length >= 8) s++;
    if (/[A-Z]/.test(pw)) s++;
    if (/[0-9]/.test(pw)) s++;
    if (/[^A-Za-z0-9]/.test(pw)) s++;
    return s; // 0..4
  }
  const strength = passwordStrengthScore(password);
  const strengthLabel = ["Too short", "Weak", "Okay", "Good", "Strong"][Math.min(strength, 4)];

  // Fetch countries from public API (restcountries)
  useEffect(() => {
    let cancelled = false;
    async function loadCountries() {
      try {
        const res = await fetch("https://restcountries.com/v3.1/all?fields=name,cca2");
        if (!res.ok) throw new Error("countries fetch failed");
        const json = await res.json();
        // map to { name, code } and sort
        const list = json
          .map((c) => ({ name: c.name?.common || c.name?.official || "Unknown", code: c.cca2 || "" }))
          .filter((c) => c.code)
          .sort((a, b) => a.name.localeCompare(b.name));
        if (!cancelled) setCountries(list);
      } catch (e) {
        console.warn("Could not fetch countries:", e);
        // fallback minimal list
        if (!cancelled) setCountries([{ name: "United States", code: "US" }, { name: "Nigeria", code: "NG" }, { name: "United Kingdom", code: "GB" }]);
      }
    }
    loadCountries();
    return () => { cancelled = true; };
  }, []);

  // client-side validation per-step
  function validateStep1() {
    const e = {};
    if (!firstName.trim()) e.firstName = "First name is required.";
    if (!lastName.trim()) e.lastName = "Last name is required.";
    if (!/^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(email)) e.email = "Enter a valid email.";
    if (!phone.trim()) e.phone = "Phone is required.";
    if (!country) e.country = "Please choose a country.";
    if (password.length < 8) e.password = "Password must be at least 8 characters.";
    if (password !== confirm) e.confirm = "Passwords do not match.";
    return e;
  }

  function validateStep2() {
    const e = {};
    if (!preferredWallet.trim()) e.preferredWallet = "Choose or enter a preferred wallet.";
    if (!cryptoWalletName.trim()) e.cryptoWalletName = "Please state which wallet holds your crypto (or N/A).";
    if (tradedBefore === null) e.tradedBefore = "Please indicate if you have traded before.";
    if (highestInvestment === "" || Number(highestInvestment) < 0) e.highestInvestment = "Enter your highest trade investment (0 if none).";
    if (!agree) e.agree = "Please accept the Terms to continue.";
    return e;
  }

  // agreement checkbox (shared across whole form)
  const [agree, setAgree] = useState(false);

  // move to next step
  function goNext() {
    const errs = validateStep1();
    setErrors(errs);
    if (Object.keys(errs).length === 0) setStep(2);
    else window.scrollTo({ top: 0, behavior: "smooth" });
  }

  function goBack() {
    setErrors({});
    setStep(1);
  }

  // final submit (Sanctum-friendly flow helper used)
  async function handleSubmit(e) {
    e.preventDefault();
    setErrors({});
    setFlash("");
    const errs = validateStep2();
    if (Object.keys(errs).length) {
      setErrors(errs);
      window.scrollTo({ top: 0, behavior: "smooth" });
      return;
    }

    setLoading(true);

    // Build payload: adapt to your backend fields
    const payload = {
      f_name: firstName,
      l_name: lastName,
      email,
      phone,
      country,
      password,
      password_confirmation: confirm,
      preferred_wallet: preferredWallet,
      crypto_wallet: cryptoWalletName,
      traded_before: tradedBefore === "yes",
      highest_investment: Number(highestInvestment) || 0,
    };

    try {
      await registerWithToken(payload);
      if (!mountedRef.current) return;
      setFlash("Account created successfully — redirecting to login...");
      // small delay then navigate
      setTimeout(() => navigate("/login"), 900);
    } catch (err) {
      // handle Laravel 422 shape or generic
      if (err && err.fieldErrors) {
        setErrors(err.fieldErrors);
      } else if (err && err.message) {
        setErrors({ _global: err.message });
      } else {
        setErrors({ _global: "Registration failed. Try again." });
      }
    } finally {
      if (mountedRef.current) setLoading(false);
    }
  }

  async function registerWithToken(payload) {
    const base = "http://127.0.0.1:8001"; // Laravel backend

    const res = await fetch(`${base}/api/register`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
      },
      body: JSON.stringify(payload),
    });

    if (res.ok) {
      const data = await res.json();
      // store token in localStorage or cookie
      localStorage.setItem("authToken", data.token);
      alert("Account created successfully!");
      navigate("/login"); // redirect to login
      return data;
    }

    if (res.status === 422) {
      const json = await res.json();
      const fieldErrors = {};
      if (json.errors) {
        Object.keys(json.errors).forEach((k) => {
          fieldErrors[k] = Array.isArray(json.errors[k])
            ? json.errors[k][0]
            : json.errors[k];
        });
      } else if (json.message) {
        fieldErrors._global = json.message;
      }
      throw { fieldErrors };
    }

    const text = await res.text();
    throw new Error(text || `Server error (${res.status})`);
  }

  /* ----------------- end helper ----------------- */

  // small UI helpers
  const walletOptions = ["MetaMask", "Trust Wallet", "Coinbase Wallet", "Ledger", "Trezor", "Other / I have none"];

  //F
  return (
    <div className="min-h-screen flex items-center justify-center bg-[color:var(--color-lightbg)] dark:bg-gray-900 transition-colors duration-300 py-12 px-4">
      <motion.div initial={{ scale: 0.995, opacity: 0 }} animate={{ scale: 1, opacity: 1 }} transition={{ duration: 0.45 }} className="relative z-10 w-full max-w-4xl mx-auto rounded-3xl shadow-2xl overflow-hidden bg-white dark:bg-[color:var(--color-primary)]">
        <div className="md:flex">
          {/* Left illustration */}
          <div className="md:w-1/2 p-10 bg-gradient-to-tr from-slate-50 to-white dark:from-[color:var(--color-primary)] dark:to-[color:var(--color-tertiary)] flex flex-col justify-center">
            <motion.div initial={{ x: -18, opacity: 0 }} animate={{ x: 0, opacity: 1 }} transition={{ delay: 0.15 }}>
              <h2 className="text-3xl font-extrabold text-[color:var(--color-primary)] dark:text-white">Create your account</h2>
              <p className="mt-3 text-sm text-gray-600 dark:text-gray-300 max-w-sm">
                Two quick steps — personal details first, then trading & wallet preferences. We support Sanctum cookie auth or token flows.
              </p>

              <div className="mt-6 flex items-center gap-4">
                <div className="h-12 w-12 rounded-xl bg-white/60 dark:bg-white/5 grid place-items-center shadow-sm">
                  <svg width="20" height="20" viewBox="0 0 24 24" className="text-[var(--color-secondary)]" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M12 3v6l4-4" stroke="#10B981" strokeWidth="1.4" strokeLinecap="round" strokeLinejoin="round"/><circle cx="12" cy="12" r="8" stroke="#10B981" strokeWidth="1.4"/></svg>
                </div>
                <div>
                  <p className="text-xs text-gray-500 dark:text-gray-300">Pro tip</p>
                  <p className="text-sm font-semibold text-[color:var(--color-primary)] dark:text-white">Keep your wallet info accurate — it helps with payouts and verification.</p>
                </div>
              </div>
            </motion.div>
          </div>

          {/* Right wizard/form */}
          <div className="w-full md:w-1/2 p-8 md:p-12">
            <div className="flex items-center justify-between mb-6">
              <div>
                <h3 className="text-2xl font-bold text-[color:var(--color-primary)] dark:text-white">Sign up</h3>
                <p className="text-sm text-gray-500 dark:text-gray-400">Create an account to access your dashboard.</p>
              </div>

              <div className="flex items-center gap-3">
                <div className="text-xs text-gray-500 dark:text-gray-300"><ThemeToggle /></div>
                <div className="text-xs text-gray-400">{step}/2</div>
              </div>
            </div>

            {/* progress dots */}
            <div className="flex items-center gap-2 mb-4">
              <div className={`w-10 h-2 rounded ${step >= 1 ? "bg-[color:var(--color-secondary)]" : "bg-gray-200"}`} />
              <div className={`w-10 h-2 rounded ${step >= 2 ? "bg-[color:var(--color-secondary)]" : "bg-gray-200"}`} />
            </div>

            
            {errors._global && <p className="text-sm text-red-500 mb-3">{errors._global}</p>}
            {flash && <p className="text-sm text-green-600 mb-3">{flash}</p>}

            <form onSubmit={handleSubmit} className="space-y-4">
              <AnimatePresence exitBeforeEnter initial={false}>
                {step === 1 ? (
                  <motion.div key="step1" initial={{ opacity: 0, x: 8 }} animate={{ opacity: 1, x: 0 }} exit={{ opacity: 0, x: -8 }} transition={{ duration: 0.25 }}>
                    {/* first name */}
                    <label className="block">
                      <span className="text-xs font-medium text-gray-600 dark:text-gray-300 flex items-center gap-2">
                        <User className="w-4 h-4" /> First name
                      </span>
                      <input
                        value={firstName}
                        onChange={(e) => setFirstName(e.target.value)}
                        placeholder="Your first name"
                        className="mt-2 w-full px-4 py-3 rounded-lg border border-gray-200 dark:border-gray-700 focus:outline-none focus:ring-2 focus:ring-[color:var(--color-secondary)] bg-white dark:bg-transparent text-[color:var(--color-primary)] dark:text-white"
                      />
                      {errors.firstName && <p className="mt-1 text-xs text-red-500">{errors.firstName}</p>}
                    </label>

                    {/* last name */}
                    <label className="block mt-2">
                      <span className="text-xs font-medium text-gray-600 dark:text-gray-300 flex items-center gap-2">
                        <User className="w-4 h-4" /> Last name
                      </span>
                      <input
                        value={lastName}
                        onChange={(e) => setLastName(e.target.value)}
                        placeholder="Your last name"
                        className="mt-2 w-full px-4 py-3 rounded-lg border border-gray-200 dark:border-gray-700 focus:outline-none focus:ring-2 focus:ring-[color:var(--color-secondary)] bg-white dark:bg-transparent text-[color:var(--color-primary)] dark:text-white"
                      />
                      {errors.lastName && <p className="mt-1 text-xs text-red-500">{errors.lastName}</p>}
                    </label>

                    {/* email */}
                    <label className="block">
                      <span className="text-xs font-medium text-gray-600 dark:text-gray-300 flex items-center gap-2 mt-2"><Mail className="w-4 h-4" /> Email</span>
                      <input type="email" value={email} onChange={(e) => setEmail(e.target.value)} placeholder="you@company.com" className="mt-2 w-full px-4 py-3 rounded-lg border border-gray-200 dark:border-gray-700 focus:outline-none focus:ring-2 focus:ring-[color:var(--color-secondary)] bg-white dark:bg-transparent text-[color:var(--color-primary)] dark:text-white" />
                      {errors.email && <p className="mt-1 text-xs text-red-500">{errors.email}</p>}
                    </label>

                    {/* phone */}
                    <label className="block">
                      <span className="text-xs font-medium text-gray-600 dark:text-gray-300 flex items-center gap-2 mt-2"><Phone className="w-4 h-4" /> Phone</span>
                      <input value={phone} onChange={(e) => setPhone(e.target.value)} placeholder="+234 800 000 000" className="mt-2 w-full px-4 py-3 rounded-lg border border-gray-200 dark:border-gray-700 focus:outline-none focus:ring-2 focus:ring-[color:var(--color-secondary)] bg-white dark:bg-transparent text-[color:var(--color-primary)] dark:text-white" />
                      {errors.phone && <p className="mt-1 text-xs text-red-500">{errors.phone}</p>}
                    </label>

                    {/* country */}
                    <label className="block">
                      <span className="text-xs font-medium text-gray-600 dark:text-gray-300 mt-2">Country</span>
                      <select value={country} onChange={(e) => setCountry(e.target.value)} className="mt-2 w-full px-4 py-3 rounded-lg border border-gray-200 dark:border-gray-700 focus:outline-none focus:ring-2 focus:ring-[color:var(--color-secondary)] bg-white dark:bg-primary text-[color:var(--color-primary)] dark:text-white">
                        <option value="">Choose country...</option>
                        {countries.map((c) => (
                          <option key={c.code} value={c.name} >{c.name}</option>
                        ))}
                      </select>
                      {errors.country && <p className="mt-1 text-xs text-red-500">{errors.country}</p>}
                    </label>

                    {/* password */}
                    <label className="block relative">
                      <span className="text-xs font-medium text-gray-600 dark:text-gray-300 flex items-center gap-2 mt-2"><Lock className="w-4 h-4" /> Password</span>
                      <input type={showPassword ? "text" : "password"} value={password} onChange={(e) => setPassword(e.target.value)} placeholder="At least 8 characters" className="mt-2 w-full px-4 py-3 rounded-lg border border-gray-200 dark:border-gray-700 focus:outline-none focus:ring-2 focus:ring-[color:var(--color-secondary)] bg-white dark:bg-transparent text-[color:var(--color-primary)] dark:text-white pr-12" />
                      <button type="button" aria-label={showPassword ? "Hide" : "Show"} onClick={() => setShowPassword((v) => !v)} className="absolute right-3 top-11 text-gray-500 dark:text-gray-300">{showPassword ? <EyeOff className="w-4 h-4" /> : <Eye className="w-4 h-4" />}</button>
                      {errors.password && <p className="mt-1 text-xs text-red-500">{errors.password}</p>}

                      {/* password strength */}
                      <div className="mt-3">
                        <div className="flex items-center justify-between text-xs text-gray-500">
                          <div>{strengthLabel}</div>
                          <div className="font-medium">{password.length ? `${strength}/4` : ""}</div>
                        </div>
                        <div className="w-full h-2 mt-2 bg-gray-100 rounded-full overflow-hidden">
                          <div className={`h-full rounded-full transition-all duration-300`} style={{ width: `${(strength / 4) * 100}%`, background: strength < 2 ? "#f87171" : strength === 2 ? "#f59e0b" : "#10b981" }} />
                        </div>
                      </div>
                    </label>

                    {/* confirm */}
                    <label className="block">
                      <span className="text-xs font-medium text-gray-600 dark:text-gray-300 flex items-center gap-2 mt-2"><Lock className="w-4 h-4" /> Confirm password</span>
                      <input type={showPassword ? "text" : "password"} value={confirm} onChange={(e) => setConfirm(e.target.value)} placeholder="Repeat password" className="mt-2 w-full px-4 py-3 rounded-lg border border-gray-200 dark:border-gray-700 focus:outline-none focus:ring-2 focus:ring-[color:var(--color-secondary)] bg-white dark:bg-transparent text-[color:var(--color-primary)] dark:text-white" />
                      {errors.confirm && <p className="mt-1 text-xs text-red-500">{errors.confirm}</p>}
                    </label>

                    <div className="mt-6 flex items-center justify-between gap-4">
                      <button type="button" onClick={goNext} className="flex-1 py-3 rounded-lg bg-[color:var(--color-secondary)] text-black font-semibold">Continue</button>
                      <button type="button" onClick={() => navigate("/login")} className="py-3 px-4 rounded-lg border border-gray-200">Cancel</button>
                    </div>
                  </motion.div>
                ) : (
                  <motion.div key="step2" initial={{ opacity: 0, x: 8 }} animate={{ opacity: 1, x: 0 }} exit={{ opacity: 0, x: -8 }} transition={{ duration: 0.25 }}>
                    {/* preferred wallet */}
                    <label className="block">
                      <span className="text-xs font-medium text-gray-600 dark:text-gray-300">Preferred wallet</span>
                      <select value={preferredWallet} onChange={(e) => setPreferredWallet(e.target.value)} className="mt-2 w-full px-4 py-3 rounded-lg border border-gray-200 dark:border-gray-700 focus:outline-none focus:ring-2 focus:ring-[color:var(--color-secondary)] bg-white dark:bg-transparent text-[color:var(--color-primary)] dark:text-white">
                        <option value="">Choose or enter...</option>
                        {walletOptions.map((w) => <option key={w} value={w}>{w}</option>)}
                      </select>
                      {errors.preferredWallet && <p className="mt-1 text-xs text-red-500">{errors.preferredWallet}</p>}
                    </label>

                    {/* wallet name */}
                    <label className="block">
                      <span className="text-xs font-medium text-gray-600 dark:text-gray-300">What wallet is your crypto in?</span>
                      <input value={cryptoWalletName} onChange={(e) => setCryptoWalletName(e.target.value)} placeholder="e.g. metamask.eth / trustwallet / ledger" className="mt-2 w-full px-4 py-3 rounded-lg border border-gray-200 dark:border-gray-700 focus:outline-none focus:ring-2 focus:ring-[color:var(--color-secondary)] bg-white dark:bg-transparent text-[color:var(--color-primary)] dark:text-white" />
                      {errors.cryptoWalletName && <p className="mt-1 text-xs text-red-500">{errors.cryptoWalletName}</p>}
                    </label>

                    {/* traded before */}
                    <div className="mt-2">
                      <div className="text-xs text-gray-600 dark:text-gray-300 mb-2">Have you traded forex / crypto / stock before?</div>
                      <div className="flex items-center gap-4">
                        <label className={`py-2 px-3 rounded-lg border ${tradedBefore === "yes" ? "border-[color:var(--color-secondary)] bg-[color:var(--color-secondary)]/10" : "border-gray-200"}`}>
                          <input type="radio" name="traded" value="yes" checked={tradedBefore === "yes"} onChange={() => setTradedBefore("yes")} className="hidden" />
                          <div className="text-sm">Yes</div>
                        </label>
                        <label className={`py-2 px-3 rounded-lg border ${tradedBefore === "no" ? "border-[color:var(--color-secondary)] bg-[color:var(--color-secondary)]/10" : "border-gray-200"}`}>
                          <input type="radio" name="traded" value="no" checked={tradedBefore === "no"} onChange={() => setTradedBefore("no")} className="hidden" />
                          <div className="text-sm">No</div>
                        </label>
                      </div>
                      {errors.tradedBefore && <p className="mt-1 text-xs text-red-500">{errors.tradedBefore}</p>}
                    </div>

                    {/* highest investment */}
                    <label className="block mt-3">
                      <span className="text-xs font-medium text-gray-600 dark:text-gray-300">What's your highest trade investment? (USD)</span>
                      <input type="number" value={highestInvestment} onChange={(e) => setHighestInvestment(e.target.value)} placeholder="e.g. 2500" className="mt-2 w-full px-4 py-3 rounded-lg border border-gray-200 dark:border-gray-700 focus:outline-none focus:ring-2 focus:ring-[color:var(--color-secondary)] bg-white dark:bg-transparent text-[color:var(--color-primary)] dark:text-white" />
                      {errors.highestInvestment && <p className="mt-1 text-xs text-red-500">{errors.highestInvestment}</p>}
                    </label>

                    {/* agree */}
                    <div className="flex items-start gap-3 mt-4">
                      <label className="flex items-center gap-2 text-sm">
                        <input type="checkbox" checked={agree} onChange={() => setAgree((a) => !a)} className="h-4 w-4 rounded text-green-500 focus:ring-green-400" />
                        <span>I agree to the <a href="#" className="underline">Terms</a> and <a href="#" className="underline">Privacy Policy</a>.</span>
                      </label>
                    </div>
                    {errors.agree && <p className="text-xs text-red-500">{errors.agree}</p>}

                    <div className="mt-6 flex items-center gap-3">
                      <button type="button" onClick={goBack} className="py-3 px-4 rounded-lg border border-gray-200">Back</button>
                      <button type="submit" disabled={loading} className="flex-1 py-3 rounded-lg bg-[color:var(--color-secondary)] text-black font-semibold">
                        {loading ? "Creating..." : "Create account"}
                      </button>
                    </div>
                  </motion.div>
                )}
              </AnimatePresence>
            </form>

            <p className="text-center text-sm text-gray-600 dark:text-gray-300 mt-4">
              Already have an account? <a href="/login" className="font-semibold text-[color:var(--color-primary)] dark:text-white underline">Sign in</a>
            </p>

            <div className="mt-6 text-xs text-gray-500 text-center">
              By creating an account you agree to our <a href="#" className="underline">Terms</a>.
            </div>
          </div>
        </div>
      </motion.div>
    </div>
  );
}
