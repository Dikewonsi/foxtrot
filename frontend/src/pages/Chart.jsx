"use client";

import React, { useEffect, useState, useMemo } from "react";
import { useSearchParams, useNavigate } from "react-router-dom";
import { motion, AnimatePresence } from "framer-motion";
import Sidebar from "../components/Sidebar";
import WinButton from "../components/WinButton";

/* --- Helper: initialize TradingView widget into #tradingview_widget --- */
const loadTradingView = (symbol) => {
  const container = document.getElementById("tradingview_widget");
  if (!container) return;

  // clear existing
  container.innerHTML = "";

  // calculate responsive height
  const height = Math.max(
    360,
    Math.min(720, Math.round(container.clientWidth * 0.5))
  ); // ratio-based fallback

  if (window.TradingView) {
    try {
      new window.TradingView.widget({
        container_id: "tradingview_widget",
        width: "100%",
        height,
        symbol: `BINANCE:${symbol.replace("/", "")}`,
        interval: "1",
        timezone: "Etc/UTC",
        theme: "dark",
        style: "1",
        locale: "en",
        hide_side_toolbar: true,
        allow_symbol_change: false,
        save_image: false,
      });
    } catch (err) {
      // fail quietly — TradingView sometimes throws on repeated initializations
      // console.warn("TradingView init failed", err);
    }
  }
};

export default function Chart() {
  const [searchParams] = useSearchParams();
  const navigate = useNavigate();
  const pair = searchParams.get("pair")?.toUpperCase() || null;

  const [coinData, setCoinData] = useState(null);
  const [loading, setLoading] = useState(true);

  // Order panel states
  const [orderSide, setOrderSide] = useState("sell");
  const [volume, setVolume] = useState(0.1);
  const [limitPrice, setLimitPrice] = useState(null);
  const [showLimit, setShowLimit] = useState(false);
  const [takeProfit, setTakeProfit] = useState(false);
  const [stopLoss, setStopLoss] = useState(false);
  const [tradeAmount, setTradeAmount] = useState("");

  const coinsArray = useMemo(
    () => [
      "bitcoin",
      "ethereum",
      "binancecoin",
      "solana",
      "ripple",
      "dogecoin",
      "pepe",
      "shiba-inu",
      "cardano",
      "toncoin",
      "avalanche-2",
      "chainlink",
      "tron",
      "polygon",
      "polkadot",
      "tether-gold",
      "pax-gold",
    ],
    []
  );

  // Load TradingView script once globally
  useEffect(() => {
    if (!document.getElementById("tradingview-script")) {
      const script = document.createElement("script");
      script.id = "tradingview-script";
      script.src = "https://s3.tradingview.com/tv.js";
      script.async = true;
      document.body.appendChild(script);
    }
  }, []);

  // Fetch + cache coin data
  useEffect(() => {
    if (!pair) return;

    const fetchData = async () => {
      setLoading(true);
      try {
        const cacheKey = "coinDataCache";
        const cache = localStorage.getItem(cacheKey);
        let data;

        if (cache) {
          const parsed = JSON.parse(cache);
          if (Date.now() - parsed.timestamp < 10 * 60 * 1000) {
            data = parsed.data;
          }
        }

        if (!data) {
          const ids = coinsArray.join(",");
          const url = `https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=${ids}`;
          const res = await fetch(url);
          data = await res.json();

          localStorage.setItem(
            cacheKey,
            JSON.stringify({ data, timestamp: Date.now() })
          );
        }

        const match = data.find(
          (c) => `${c.symbol.toUpperCase()}/USDT` === pair
        );
        setCoinData(match || null);

        if (match) {
          setLimitPrice(match.current_price);
          // wait until TradingView script loads
          const interval = setInterval(() => {
            if (window.TradingView) {
              loadTradingView(pair);
              clearInterval(interval);
            }
          }, 500);
        }
      } catch (err) {
        console.error(err);
        setCoinData(null);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [pair, coinsArray]);

  // early returns
  if (!pair) {
    return (
      <div className="text-center text-red-500 p-4">
        ❌ No pair (?pair=BTC/USDT)
      </div>
    );
  }
  if (loading) {
    return <div className="p-6 text-center">⏳ Loading {pair}...</div>;
  }
  if (!coinData) {
    return (
      <div className="text-center text-red-500 p-4">⚠️ No data for {pair}</div>
    );
  }

  // destructure coin data
  const {
    symbol,
    current_price,
    price_change_percentage_24h,
    high_24h,
    low_24h,
  } = coinData;
  const changeClass =
    price_change_percentage_24h >= 0 ? "text-secondary" : "text-red-500";

  // sample order history (replace with real data as needed)
  const sampleOrders = [
    {
      id: "ORD-1001",
      side: "BUY",
      amount: 500,
      tp: 520,
      sl: 480,
      price: 25300,
      status: "profit",
      meta: { source: "Spot", ticket: "472930" },
    },
    {
      id: "ORD-0992",
      side: "SELL",
      amount: 120,
      tp: 0,
      sl: 0,
      price: 26700,
      status: "loss",
      meta: { source: "Margin", ticket: "472931" },
    },
    {
      id: "ORD-0962",
      side: "PROFIT",
      amount: 290,
      tp: 320,
      sl: 280,
      price: 25300,
      status: "profit",
      meta: { source: "Margin", ticket: "472932" },
    },
  ];

  return (
    <div className="md:flex min-h-screen">
      <Sidebar />

      <div className="flex-1 p-4 pt-[100px]">
        {/* Header */}
        <motion.div
          initial={{ opacity: 0, y: -8 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.35 }}
          className="flex items-center justify-between mb-4"
        >
          <div className="flex items-center gap-3">
            <button
              onClick={() => navigate(-1)}
              className="px-3 py-2 rounded-lg bg-gray-200 dark:bg-tertiary text-black dark:text-white hover:opacity-90 transition"
            >
              ←
            </button>
            <div>
              <h2 className="text-lg font-semibold">
                {symbol.toUpperCase()}/USDT
              </h2>
              <div className="text-sm text-gray-400">
                Live market data & chart
              </div>
            </div>
          </div>

          <div className="flex items-center gap-6">
            <div className={`text-right ${changeClass}`}>
              <div className="text-xl font-bold">
                ${current_price.toFixed(3)}
              </div>
              <div className="text-sm">
                {price_change_percentage_24h.toFixed(2)}%
              </div>
            </div>
          </div>
        </motion.div>

        {/* Chart + Order Panel */}
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-6">
          {/* Chart card */}
          <motion.div
            initial={{ opacity: 0, y: 8 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.05 }}
            className="lg:col-span-8 rounded-2xl bg-lightbg dark:bg-primary shadow-md overflow-hidden"
          >
            <div className="p-4 border-b border-gray-200 dark:border-tertiary flex items-center justify-between">
              <div className="flex items-center gap-4">
                <div className="text-sm text-gray-500">
                  H: {high_24h.toFixed(3)}
                </div>
                <div className="text-sm text-gray-500">
                  L: {low_24h.toFixed(3)}
                </div>
              </div>
            </div>

            <div className="p-4">
              <div
                id="tradingview_widget"
                className="w-full h-[380px] md:h-[520px] rounded-md bg-black/5 dark:bg-black"
              />
            </div>
          </motion.div>

          {/*    Order Panel */}
          <motion.aside
            initial={{ opacity: 0, y: 8 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.08 }}
            className="lg:col-span-4 rounded-2xl bg-white/70 dark:bg-gray-900/60 shadow-lg p-4 flex flex-col backdrop-blur-sm"
          >
            {/* Header */}
            <div className="flex items-center justify-between mb-4">
              <div>
                <div className="text-sm font-semibold">Quick Trade</div>
                <div className="text-xs text-gray-500 dark:text-gray-400">
                  Market & Limit orders
                </div>
              </div>

              <div className="text-right">
                <div className="text-sm text-gray-400">Balance</div>
                <div className="text-sm font-semibold text-[var(--color-secondary)]">
                  $12,300.00
                </div>
              </div>
            </div>

            {/* Tabs (Market / Limit) */}
            <div className="mb-4">
              <div className="relative bg-transparent rounded-xl overflow-hidden flex border border-gray-200 dark:border-tertiary">
                <button
                  onClick={() => setShowLimit(false)}
                  className={`flex-1 py-2 text-sm font-semibold ${
                    !showLimit ? "text-black dark:text-white" : "text-gray-400"
                  }`}
                >
                  Market
                </button>

                <button
                  onClick={() => setShowLimit(true)}
                  className={`flex-1 py-2 text-sm font-semibold ${
                    showLimit ? "text-black dark:text-white" : "text-gray-400"
                  }`}
                >
                  Limit
                </button>

                <motion.div
                  layout
                  initial={false}
                  animate={{ x: showLimit ? "50%" : "0%" }}
                  transition={{ type: "spring", stiffness: 300, damping: 30 }}
                  className="absolute bottom-0 left-0 w-1/2 h-[3px] rounded"
                  style={{
                    background:
                      "linear-gradient(90deg,var(--color-secondary),#00d36a)",
                  }}
                />
              </div>
            </div>

            {/* Buy / Sell Toggle */}
            <div className="flex gap-3 mb-4 items-center">
              <motion.button
                whileTap={{ scale: 0.98 }}
                onClick={() => setOrderSide("sell")}
                className={`flex-1 py-3 rounded-lg font-semibold text-sm ${
                  orderSide === "sell"
                    ? "ring-1 ring-red-400/30 bg-red-50 dark:bg-red-900/20 text-red-600"
                    : "bg-transparent"
                }`}
              >
                SELL
              </motion.button>

              <motion.button
                whileTap={{ scale: 0.98 }}
                onClick={() => setOrderSide("buy")}
                className={`flex-1 py-3 rounded-lg font-semibold text-sm ${
                  orderSide === "buy"
                    ? "bg-[var(--color-secondary)] text-black shadow"
                    : "bg-transparent"
                }`}
                style={
                  orderSide === "buy"
                    ? { boxShadow: "0 8px 28px rgba(0,230,118,0.12)" }
                    : {}
                }
              >
                BUY
              </motion.button>
            </div>

            {/* Volume with slider & presets */}
            <div className="mb-4">
              <label className="text-sm text-gray-500 block mb-2">
                Volume (lot)
              </label>

              <div className="flex items-center gap-3 mb-3">
                <button
                  onClick={() =>
                    setVolume((v) => Math.max(0.1, +(v - 0.1).toFixed(2)))
                  }
                  className="px-3 py-2 rounded-lg bg-gray-100 dark:bg-tertiary"
                >
                  −
                </button>

                <div className="flex-1">
                  <input
                    type="range"
                    min="0.1"
                    max="10"
                    step="0.1"
                    value={volume}
                    onChange={(e) => setVolume(+e.target.value)}
                    className="w-full h-2 bg-transparent accent-[var(--color-secondary)]"
                    aria-label="Volume slider"
                  />
                  <div className="mt-2 text-center text-sm font-semibold">
                    {volume.toFixed(2)} lot
                  </div>
                </div>

                <button
                  onClick={() => setVolume((v) => +(v + 0.1).toFixed(2))}
                  className="px-3 py-2 rounded-lg bg-gray-100 dark:bg-tertiary"
                >
                  +
                </button>
              </div>

              <div className="flex gap-2">
                {[0.1, 0.5, 1, 2].map((v) => (
                  <motion.button
                    key={v}
                    onClick={() => setVolume(v)}
                    whileTap={{ scale: 0.97 }}
                    className={`flex-1 py-2 rounded-lg text-sm ${
                      volume === v
                        ? "bg-[var(--color-secondary)] text-black font-semibold"
                        : "bg-gray-100 dark:bg-tertiary "
                    }`}
                  >
                    {v}
                  </motion.button>
                ))}
              </div>
            </div>

            {/* Limit price (animated reveal) */}
            <AnimatePresence initial={false}>
              {showLimit && (
                <motion.div
                  initial={{ opacity: 0, y: 6 }}
                  animate={{ opacity: 1, y: 0 }}
                  exit={{ opacity: 0 }}
                  className="mb-4"
                >
                  <label className="text-sm text-gray-500 block mb-2">
                    Limit Price
                  </label>
                  <div className="flex items-center justify-between px-4 py-3 rounded-lg bg-gray-100 dark:bg-tertiary">
                    <button
                      onClick={() =>
                        setLimitPrice((p) => (p ? +(p - 0.01).toFixed(5) : 0))
                      }
                      className="px-3 py-2 rounded-lg bg-transparent"
                    >
                      −
                    </button>

                    <div className="font-semibold text-center">
                      {limitPrice ? limitPrice.toFixed(5) : "--"}
                    </div>

                    <button
                      onClick={() =>
                        setLimitPrice((p) => (p ? +(p + 0.01).toFixed(5) : 0))
                      }
                      className="px-3 py-2 rounded-lg bg-transparent"
                    >
                      +
                    </button>
                  </div>
                </motion.div>
              )}
            </AnimatePresence>

            {/* TP / SL compact UI */}
            <div className="mb-4 grid grid-cols-1 gap-3">
              <div className="flex items-center justify-between">
                <label className="flex items-center gap-2 text-sm">
                  <input
                    type="checkbox"
                    checked={takeProfit}
                    onChange={() => setTakeProfit((s) => !s)}
                  />
                  <span className="text-sm">Take Profit</span>
                </label>

                {takeProfit && (
                  <input
                    type="number"
                    placeholder="TP price"
                    className="ml-3 w-32 px-3 py-2 rounded bg-gray-100 dark:bg-tertiary text-sm"
                  />
                )}
              </div>

              <div className="flex items-center justify-between">
                <label className="flex items-center gap-2 text-sm">
                  <input
                    type="checkbox"
                    checked={stopLoss}
                    onChange={() => setStopLoss((s) => !s)}
                  />
                  <span className="text-sm">Stop Loss</span>
                </label>

                {stopLoss && (
                  <input
                    type="number"
                    placeholder="SL price"
                    className="ml-3 w-32 px-3 py-2 rounded bg-gray-100 dark:bg-tertiary text-sm"
                  />
                )}
              </div>
            </div>

            {/* Trade Amount */}
            <div className="mb-4">
              <label className="text-sm text-gray-500 block mb-2">
                Trade Amount ($)
              </label>
              <input
                type="number"
                placeholder="Enter amount"
                value={tradeAmount}
                onChange={(e) => setTradeAmount(e.target.value)}
                className="w-full px-3 py-3 rounded-lg bg-gray-100 dark:bg-tertiary"
              />
            </div>

            {/* Summary row */}
            <div className="mb-4 rounded-lg p-3 bg-gray-50 dark:bg-gray-800 flex items-center justify-between text-sm">
              <div>
                <div className="text-xs text-gray-400">Est. Position Value</div>
                <div className="font-semibold">
                  ${(volume * (current_price || 0)).toFixed(2)}
                </div>
              </div>

              <div className="text-right">
                <div className="text-xs text-gray-400">Leverage</div>
                <div className="font-semibold">1:100</div>
              </div>
            </div>

            {/* CTA */}
            <div className="mt-auto">
              <motion.button
                whileTap={{ scale: 0.995 }}
                className="w-full py-3 rounded-lg font-semibold text-white text-lg"
                style={{
                  background:
                    orderSide === "sell"
                      ? "linear-gradient(90deg,#ef4444,#f87171)"
                      : "linear-gradient(90deg,var(--color-secondary),#00d36a)",
                  boxShadow:
                    orderSide === "buy"
                      ? "0 12px 30px rgba(0,230,118,0.12)"
                      : "0 12px 30px rgba(239,68,68,0.08)",
                }}
              >
                {orderSide.toUpperCase()}
              </motion.button>
            </div>
          </motion.aside>
        </div>

        {/* Order history as cards */}
        <motion.div
          initial={{ opacity: 0, y: 8 }}
          animate={{ opacity: 1, y: 0 }}
          className="mt-6 grid grid-cols-1 md:grid-cols-4 gap-4"
        >
          {sampleOrders.map((o) => (
            <motion.div
              key={o.id}
              whileHover={{ scale: 1.02 }}
              className="rounded-xl p-4 bg-white dark:bg-primary shadow-sm"
            >
              <div className="flex items-center justify-between mb-3">
                <div className="flex items-center gap-3">
                  <div
                    className={`px-3 py-1 rounded text-sm font-semibold ${
                      o.side === "BUY"
                        ? "bg-green-100 text-green-700"
                        : "bg-red-100 text-red-700"
                    }`}
                  >
                    {o.side}
                  </div>
                  <div>
                    <div className="font-semibold text-sm">{o.id}</div>
                    <div className="text-xs text-gray-400">
                      {o.meta.source} • {o.meta.ticket}
                    </div>
                  </div>
                </div>
                <div
                  className={`font-bold ${
                    o.status === "profit"
                      ? "text-secondary"
                      : o.status === "loss"
                      ? "text-red-500"
                      : "text-gray-400"
                  }`}
                >
                  {o.status.toUpperCase()}
                </div>
              </div>

              <div className="grid grid-cols-2 gap-2 text-sm text-gray-600 mb-3">
                <div>
                  <div className="text-xs text-gray-400">Amount</div>
                  <div className="font-medium">${o.amount}</div>
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
                <div className="text-xs text-gray-500">Placed: 2025-09-01</div>
                <div>
                  {o.status === "profit" && (
                    <WinButton
                      amount="NGN 1,960.00"
                      source="Sport"
                      ticket={o.id}
                    />
                  )}
                </div>
              </div>
            </motion.div>
          ))}
        </motion.div>
      </div>
    </div>
  );
}
