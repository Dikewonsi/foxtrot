"use client";

import { useEffect, useRef, useState, useCallback } from "react";
import { useSearchParams, useNavigate } from "react-router-dom";
import { motion, AnimatePresence } from "framer-motion";
import Sidebar from "../components/Sidebar";
import WinButton from "../components/WinButton";

/* ---------- SAMPLE / FALLBACK STOCK DATA (replace with backend) ---------- */
const SAMPLE_STOCKS = [
  {
    symbol: "AAPL",
    name: "Apple Inc.",
    exchange: "NASDAQ",
    price: 174.21,
    change24h: 1.12,
    high24h: 175.0,
    low24h: 171.5,
  },
  {
    symbol: "MSFT",
    name: "Microsoft Corp.",
    exchange: "NASDAQ",
    price: 342.18,
    change24h: -0.45,
    high24h: 345.2,
    low24h: 338.9,
  },
  {
    symbol: "TSLA",
    name: "Tesla, Inc.",
    exchange: "NASDAQ",
    price: 260.33,
    change24h: 2.46,
    high24h: 262.5,
    low24h: 253.8,
  },
  {
    symbol: "AMZN",
    name: "Amazon.com, Inc.",
    exchange: "NASDAQ",
    price: 138.77,
    change24h: -0.9,
    high24h: 140.5,
    low24h: 137.2,
  },
  {
    symbol: "GOOGL",
    name: "Alphabet Inc.",
    exchange: "NASDAQ",
    price: 132.42,
    change24h: 0.34,
    high24h: 133.6,
    low24h: 130.1,
  },
];

/* ---------- TradingView loader utility (promise + single script) ---------- */
function ensureTradingViewScript() {
  if (typeof window === "undefined") return Promise.reject(new Error("No window"));
  if (window.TradingView) return Promise.resolve();

  if (window.__tvScriptLoadingPromise) return window.__tvScriptLoadingPromise;

  const script = document.createElement("script");
  script.id = "tradingview-script";
  script.src = "https://s3.tradingview.com/tv.js";
  script.async = true;

  window.__tvScriptLoadingPromise = new Promise((resolve) => {
    script.onload = () => {
      // tiny delay to let the script settle
      setTimeout(() => {
        resolve();
      }, 50);
    };
    script.onerror = (e) => {
      console.error("TradingView script failed to load", e);
      // resolve anyway so UI can handle fallback gracefully
      resolve();
    };
  });

  document.body.appendChild(script);
  return window.__tvScriptLoadingPromise;
}

/* ---------- StockPage component ---------- */
export default function StockPage() {
  const [searchParams] = useSearchParams();
  const navigate = useNavigate();
  const requested = (searchParams.get("symbol") || "AAPL").toUpperCase();

  const [stock, setStock] = useState(null); // {symbol, name, exchange, price, ...}
  const [loading, setLoading] = useState(true);

  // order panel states
  const [orderSide, setOrderSide] = useState("sell"); // buy | sell
  const [volume, setVolume] = useState(1); // number of shares
  const [showLimit, setShowLimit] = useState(false);
  const [limitPrice, setLimitPrice] = useState(null);
  const [takeProfit, setTakeProfit] = useState(false);
  const [stopLoss, setStopLoss] = useState(false);
  const [tradeAmount, setTradeAmount] = useState("");

  // sample order history (replace with backend)
  const sampleOrders = [
    { id: "S-101", side: "BUY", amount: 10, price: 172.5, status: "closed", placed: "2025-09-03" },
    { id: "S-092", side: "SELL", amount: 5, price: 175.1, status: "closed", placed: "2025-08-29" },
  ];

  // TradingView refs / tokens
  const tvContainerRef = useRef(null);
  const tvWidgetRef = useRef(null);
  const tvInitTokenRef = useRef(0);

  /* Load TradingView script once (best-effort) */
  useEffect(() => {
    ensureTradingViewScript().catch((e) => {
      console.warn("TradingView ensure failed:", e);
    });
  }, []);

  /* fetch stock info (backend then fallback) */
  useEffect(() => {
    let cancelled = false;
    setLoading(true);

    const fetchStock = async () => {
      try {
        const res = await fetch(`/api/stocks?symbol=${encodeURIComponent(requested)}`, { method: "GET" });
        if (res.ok) {
          const data = await res.json();
          if (!cancelled && data && data.symbol) {
            setStock(data);
            setLimitPrice(data.price || null);
          } else {
            throw new Error("No backend data");
          }
        } else {
          throw new Error("Backend unavailable");
        }
      } catch (e) {
        // fallback to sample array
        const found = SAMPLE_STOCKS.find((s) => s.symbol === requested) || SAMPLE_STOCKS[0];
        if (!cancelled) {
          setStock(found);
          setLimitPrice(found.price || null);
        }
      } finally {
        if (!cancelled) setLoading(false);
      }
    };

    fetchStock();
    return () => {
      cancelled = true;
    };
  }, [requested]);

  /* Initialize / re-init TradingView widget when stock available */
  const initTradingView = useCallback(
    async (tvSymbol) => {
      const token = ++tvInitTokenRef.current;
      await ensureTradingViewScript();

      // if another init started meanwhile, abort
      if (token !== tvInitTokenRef.current) return;

      const container = tvContainerRef.current;
      if (!container) {
        console.warn("TradingView container missing");
        return;
      }

      // clear previous
      container.innerHTML = "";

      if (!window.TradingView) {
        console.warn("window.TradingView not available — script may be blocked by adblock/CSP");
        return;
      }

      const height = Math.max(360, Math.min(720, Math.round(container.clientWidth * 0.55)));

      try {
        // note: tradingview.widget may not return a stable object in all builds
        // but calling new window.TradingView.widget(...) is the recommended init.
        tvWidgetRef.current = new window.TradingView.widget({
          container_id: container.id || "tradingview_widget",
          width: "100%",
          height,
          symbol: tvSymbol,
          interval: "60",
          timezone: "Etc/UTC",
          theme: "dark",
          style: "1",
          locale: "en",
          hide_side_toolbar: true,
          allow_symbol_change: false,
          save_image: false,
        });
      } catch (err) {
        console.error("TradingView init error:", err);
      }
    },
    []
  );

  useEffect(() => {
    if (!loading && stock) {
      const tvSymbol = `${stock.exchange || "NASDAQ"}:${stock.symbol}`;
      initTradingView(tvSymbol);
    }
  }, [loading, stock, initTradingView]);

  /* Re-init on resize for responsiveness (debounced) */
  useEffect(() => {
    const onResize = () => {
      if (!stock) return;
      clearTimeout(window.__tvResizeTimer);
      window.__tvResizeTimer = setTimeout(() => {
        const tvSymbol = `${stock.exchange || "NASDAQ"}:${stock.symbol}`;
        initTradingView(tvSymbol);
      }, 250);
    };
    window.addEventListener("resize", onResize);
    return () => {
      window.removeEventListener("resize", onResize);
      clearTimeout(window.__tvResizeTimer);
    };
  }, [stock, initTradingView]);

  /* cleanup on unmount */
  useEffect(() => {
    return () => {
      tvInitTokenRef.current++;
      if (tvContainerRef.current) tvContainerRef.current.innerHTML = "";
    };
  }, []);

  /* simple buy/sell handler placeholder */
  function handleTrade() {
    const amount = Number(tradeAmount) || 0;
    window.alert(`${orderSide.toUpperCase()} ${volume} shares of ${stock.symbol} ${amount ? `for $${amount}` : ""}`);
  }

  if (loading) return <div className="p-6 text-center">⏳ Loading {requested}...</div>;
  if (!stock) return <div className="p-6 text-center text-red-400">⚠️ No stock data available</div>;

  const changeClass = stock.change24h >= 0 ? "text-secondary" : "text-red-500";

  return (
    <div className="md:flex min-h-screen">
      <Sidebar />

      <div className="flex-1 p-4 pt-[100px]">
        {/* header */}
        <motion.div initial={{ opacity: 0, y: -8 }} animate={{ opacity: 1, y: 0 }} transition={{ duration: 0.35 }} className="flex items-center justify-between mb-4">
          <div className="flex items-center gap-3">
            <button onClick={() => navigate(-1)} className="px-3 py-2 rounded-lg bg-gray-200 dark:bg-tertiary text-black dark:text-white hover:opacity-90 transition">←</button>
            <div>
              <h2 className="text-lg font-semibold">{stock.symbol} • {stock.name}</h2>
              <div className="text-sm text-gray-400">Live stock data & chart</div>
            </div>
          </div>

          <div className="flex items-center gap-6">
            <div className={`text-right ${changeClass}`}>
              <div className="text-xl font-bold">${(stock.price || 0).toFixed(2)}</div>
              <div className="text-sm">{(stock.change24h || 0).toFixed(2)}%</div>
            </div>
          </div>
        </motion.div>

        {/* chart + panel */}
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-6">
          {/* chart */}
          <motion.div initial={{ opacity: 0, y: 8 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.05 }} className="lg:col-span-8 rounded-2xl bg-lightbg dark:bg-primary shadow-md overflow-hidden">
            <div className="p-4 border-b border-gray-200 dark:border-tertiary flex items-center justify-between">
              <div className="flex items-center gap-4">
                <div className="text-sm text-gray-500">H: {(stock.high24h || 0).toFixed(2)}</div>
                <div className="text-sm text-gray-500">L: {(stock.low24h || 0).toFixed(2)}</div>
              </div>

              <div className="text-sm text-gray-400">Exchange: {stock.exchange || "NASDAQ"}</div>
            </div>

            <div className="p-4">
              <div id="tradingview_widget" ref={tvContainerRef} className="w-full h-[380px] md:h-[520px] rounded-md bg-black/5 dark:bg-black" />
            </div>
          </motion.div>

          {/* order panel */}
          <motion.aside initial={{ opacity: 0, y: 8 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.08 }} className="lg:col-span-4 rounded-2xl bg-white/80 dark:bg-gray-900/60 shadow-lg p-4 flex flex-col backdrop-blur-sm">
            <div className="flex items-center justify-between mb-4">
              <div>
                <div className="text-sm font-semibold">Quick Trade</div>
                <div className="text-xs text-gray-500 dark:text-gray-400">Market & Limit orders</div>
              </div>

              <div className="text-right">
                <div className="text-sm text-gray-400">Buying Power</div>
                <div className="text-sm font-semibold text-[var(--color-secondary)]">$12,300.00</div>
              </div>
            </div>

            {/* market/limit toggle */}
            <div className="mb-4">
              <div className="relative bg-transparent rounded-xl overflow-hidden flex border border-gray-200 dark:border-tertiary">
                <button onClick={() => setShowLimit(false)} className={`flex-1 py-2 text-sm font-semibold ${!showLimit ? "text-black dark:text-white" : "text-gray-400"}`}>Market</button>
                <button onClick={() => setShowLimit(true)} className={`flex-1 py-2 text-sm font-semibold ${showLimit ? "text-black dark:text-white" : "text-gray-400"}`}>Limit</button>
                <motion.div layout initial={false} animate={{ x: showLimit ? "50%" : "0%" }} transition={{ type: "spring", stiffness: 300, damping: 30 }} className="absolute bottom-0 left-0 w-1/2 h-[3px] rounded" style={{ background: "linear-gradient(90deg,var(--color-secondary),#00d36a)" }} />
              </div>
            </div>

            {/* buy/sell */}
            <div className="flex gap-3 mb-4 items-center">
              <motion.button whileTap={{ scale: 0.98 }} onClick={() => setOrderSide("sell")} className={`flex-1 py-3 rounded-lg font-semibold text-sm ${orderSide === "sell" ? "ring-1 ring-red-400/30 bg-red-50 dark:bg-red-900/20 text-red-600" : "bg-transparent"}`}>SELL</motion.button>

              <motion.button whileTap={{ scale: 0.98 }} onClick={() => setOrderSide("buy")} className={`flex-1 py-3 rounded-lg font-semibold text-sm ${orderSide === "buy" ? "bg-[var(--color-secondary)] text-black shadow" : "bg-transparent"}`} style={orderSide === "buy" ? { boxShadow: "0 8px 28px rgba(0,230,118,0.12)" } : {}}>BUY</motion.button>
            </div>

            {/* volume */}
            <div className="mb-4">
              <label className="text-sm text-gray-500 block mb-2">Shares</label>

              <div className="flex items-center gap-3 mb-3">
                <button onClick={() => setVolume((v) => Math.max(1, v - 1))} className="px-3 py-2 rounded-lg bg-gray-100 dark:bg-tertiary">−</button>

                <div className="flex-1">
                  <input type="range" min="1" max="100" step="1" value={volume} onChange={(e) => setVolume(+e.target.value)} className="w-full h-2 bg-transparent accent-[var(--color-secondary)]" aria-label="Shares slider" />
                  <div className="mt-2 text-center text-sm font-semibold">{volume} share{volume > 1 ? "s" : ""}</div>
                </div>

                <button onClick={() => setVolume((v) => Math.min(100, v + 1))} className="px-3 py-2 rounded-lg bg-gray-100 dark:bg-tertiary">+</button>
              </div>

              <div className="flex gap-2">
                {[1, 5, 10, 25].map((v) => (
                  <motion.button key={v} onClick={() => setVolume(v)} whileTap={{ scale: 0.97 }} className={`flex-1 py-2 rounded-lg text-sm ${volume === v ? "bg-[var(--color-secondary)] text-black font-semibold" : "bg-gray-100 dark:bg-tertiary"}`}>{v}</motion.button>
                ))}
              </div>
            </div>

            {/* limit price reveal */}
            <AnimatePresence initial={false}>
              {showLimit && (
                <motion.div initial={{ opacity: 0, y: 6 }} animate={{ opacity: 1, y: 0 }} exit={{ opacity: 0 }} className="mb-4">
                  <label className="text-sm text-gray-500 block mb-2">Limit Price</label>
                  <div className="flex items-center justify-between px-4 py-3 rounded-lg bg-gray-100 dark:bg-tertiary">
                    <button onClick={() => setLimitPrice((p) => (p ? +(p - 0.01).toFixed(2) : 0))} className="px-3 py-2 rounded-lg">−</button>
                    <div className="font-semibold text-center">{limitPrice ? limitPrice.toFixed(2) : "--"}</div>
                    <button onClick={() => setLimitPrice((p) => (p ? +(p + 0.01).toFixed(2) : 0))} className="px-3 py-2 rounded-lg">+</button>
                  </div>
                </motion.div>
              )}
            </AnimatePresence>

            {/* TP / SL */}
            <div className="mb-4 grid grid-cols-1 gap-3">
              <div className="flex items-center justify-between">
                <label className="flex items-center gap-2 text-sm"><input type="checkbox" checked={takeProfit} onChange={() => setTakeProfit((s) => !s)} /> <span className="text-sm">Take Profit</span></label>
                {takeProfit && <input type="number" placeholder="TP price" className="ml-3 w-32 px-3 py-2 rounded bg-gray-100 dark:bg-tertiary text-sm" />}
              </div>

              <div className="flex items-center justify-between">
                <label className="flex items-center gap-2 text-sm"><input type="checkbox" checked={stopLoss} onChange={() => setStopLoss((s) => !s)} /> <span className="text-sm">Stop Loss</span></label>
                {stopLoss && <input type="number" placeholder="SL price" className="ml-3 w-32 px-3 py-2 rounded bg-gray-100 dark:bg-tertiary text-sm" />}
              </div>
            </div>

            {/* trade amount */}
            <div className="mb-4">
              <label className="text-sm text-gray-500 block mb-2">Trade Amount ($)</label>
              <input type="number" placeholder="Auto calculated or enter override" value={tradeAmount} onChange={(e) => setTradeAmount(e.target.value)} className="w-full px-3 py-3 rounded-lg bg-gray-100 dark:bg-tertiary" />
            </div>

            {/* summary */}
            <div className="mb-4 rounded-lg p-3 bg-gray-50 dark:bg-gray-800 flex items-center justify-between text-sm">
              <div>
                <div className="text-xs text-gray-400">Est. Position Value</div>
                <div className="font-semibold">${(volume * (stock.price || 0)).toFixed(2)}</div>
              </div>
              <div className="text-right">
                <div className="text-xs text-gray-400">Market</div>
                <div className="font-semibold">{stock.exchange || "NASDAQ"}</div>
              </div>
            </div>

            {/* CTA */}
            <div className="mt-auto">
              <motion.button whileTap={{ scale: 0.995 }} onClick={handleTrade} className="w-full py-3 rounded-lg font-semibold text-white text-lg" style={{ background: orderSide === "sell" ? "linear-gradient(90deg,#ef4444,#f87171)" : "linear-gradient(90deg,var(--color-secondary),#00d36a)", boxShadow: orderSide === "buy" ? "0 12px 30px rgba(0,230,118,0.12)" : "0 12px 30px rgba(239,68,68,0.08)" }}>{orderSide.toUpperCase()}</motion.button>
            </div>
          </motion.aside>
        </div>

        {/* order history cards */}
        <motion.div initial={{ opacity: 0, y: 8 }} animate={{ opacity: 1, y: 0 }} className="mt-6 grid grid-cols-1 md:grid-cols-4 gap-4">
          {sampleOrders.map((o) => (
            <motion.div key={o.id} whileHover={{ scale: 1.02 }} className="rounded-xl p-4 bg-white dark:bg-primary shadow-sm">
              <div className="flex items-center justify-between mb-3">
                <div className="flex items-center gap-3">
                  <div className={`px-3 py-1 rounded text-sm font-semibold ${o.side === "BUY" ? "bg-green-100 text-green-700" : "bg-red-100 text-red-700"}`}>{o.side}</div>
                  <div>
                    <div className="font-semibold text-sm">{o.id}</div>
                    <div className="text-xs text-gray-400">Placed {o.placed}</div>
                  </div>
                </div>
                <div className="font-bold">{o.status.toUpperCase()}</div>
              </div>

              <div className="grid grid-cols-2 gap-2 text-sm text-gray-600 mb-3">
                <div>
                  <div className="text-xs text-gray-400">Shares</div>
                  <div className="font-medium">{o.amount}</div>
                </div>
                <div>
                  <div className="text-xs text-gray-400">Price</div>
                  <div className="font-medium">${o.price.toLocaleString()}</div>
                </div>

                <div>
                  <div className="text-xs text-gray-400">TP</div>
                  <div className="font-medium">{o.tp ? `$${o.tp}` : "—"}</div>
                </div>
                <div>
                  <div className="text-xs text-gray-400">SL</div>
                  <div className="font-medium">{o.sl ? `$${o.sl}` : "—"}</div>
                </div>
              </div>

              <div className="flex items-center justify-between">
                <div className="text-xs text-gray-500">Status info</div>
                <div>{o.status === "closed" && <WinButton amount="NGN 1,960.00" source="Stock Payout" ticket={o.id} />}</div>
              </div>
            </motion.div>
          ))}
        </motion.div>
      </div>
    </div>
  );
}
