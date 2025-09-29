"use client";

import { useEffect, useMemo, useState } from "react";
import { Link } from "react-router-dom";
import { motion, AnimatePresence } from "framer-motion";
import { Search } from "lucide-react";
import Sidebar from "../components/Sidebar";
import BottomNavbar from "../components/BottomNavbar";

/**
 * Modern, responsive Market page
 * - No horizontal overflow on mobile (uses fluid widths and internal wrapping)
 * - Animated card list using Framer Motion
 * - Clean pill tabs + search
 * - Keeps CoinGecko fetch + caching logic from your original
 */

const COIN_CATEGORIES = {
  favourite: ["bitcoin", "ethereum", "binancecoin", "solana", "ripple"],
  hot: [
    "bitcoin",
    "ethereum",
    "dogecoin",
    "pepe",
    "shiba-inu",
    "solana",
    "cardano",
    "ripple",
    "toncoin",
    "avalanche-2",
    "stellar",  
  ],

  crypto: [
    "cardano",
    "dogecoin",
    "shiba-inu",
    "chainlink",
    "tron",
    "polygon",
    "polkadot",
  ],
  metals: ["tether-gold", "pax-gold"],
};

const CACHE_TTL = 5 * 60 * 1000; // 5 minutes

export default function Market() {
  const [activeTab, setActiveTab] = useState("hot");
  const [coinData, setCoinData] = useState({});
  const [loading, setLoading] = useState(false);
  const [query, setQuery] = useState("");

  const categories = useMemo(() => Object.keys(COIN_CATEGORIES), []);

  useEffect(() => {
    fetchCategoryData(activeTab);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [activeTab]);

  async function fetchCategoryData(category) {
    setLoading(true);
    const cacheKey = `market-${category}`;
    try {
      const cached = localStorage.getItem(cacheKey);
      if (cached) {
        const parsed = JSON.parse(cached);
        if (Date.now() - parsed.timestamp < CACHE_TTL) {
          setCoinData((prev) => ({ ...prev, [category]: parsed.data }));
          setLoading(false);
          // fetch in background for freshness
          fetchAndCache(category, cacheKey).catch(() => {});
          return;
        }
      }
      await fetchAndCache(category, cacheKey);
    } catch (err) {
      console.error("market fetch error", err);
      setLoading(false);
    }
  }

  async function fetchAndCache(category, cacheKey) {
    const ids = COIN_CATEGORIES[category] || [];
    if (!ids.length) {
      setCoinData((prev) => ({ ...prev, [category]: [] }));
      return;
    }
    const url = `https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=${ids.join(
      ","
    )}&order=market_cap_desc&sparkline=false`;
    const res = await fetch(url);
    if (!res.ok) throw new Error("fetch failed");
    const data = await res.json();
    setCoinData((prev) => ({ ...prev, [category]: data }));
    try {
      localStorage.setItem(
        cacheKey,
        JSON.stringify({ data, timestamp: Date.now() })
      );
    } catch {}
    setLoading(false);
  }

  // filter by search
  const list = (coinData[activeTab] || []).filter((c) => {
    if (!query.trim()) return true;
    const q = query.trim().toLowerCase();
    return (
      c.name?.toLowerCase().includes(q) ||
      c.symbol?.toLowerCase().includes(q) ||
      `${c.symbol?.toUpperCase()}/USDT`.toLowerCase().includes(q)
    );
  });

  const container = {
    hidden: {},
    show: { transition: { staggerChildren: 0.06 } },
  };
  const item = {
    hidden: { opacity: 0, y: 8 },
    show: {
      opacity: 1,
      y: 0,
      transition: { type: "spring", stiffness: 180, damping: 20 },
    },
  };

  return (
    <div className="min-h-screen md:flex bg-lightbg dark:bg-primary text-black dark:text-white">
      <Sidebar />

      <main className="flex-1 px-4 md:px-8 py-6 max-w-7xl mx-auto mt-20">
        {/* Header */}
        <div className="sticky top-3 z-30 bg-transparent">
          <div className="flex items-center justify-between gap-4 mb-3">
            <div>
              <h1 className="text-2xl font-bold leading-tight">Market</h1>
              <p className="text-sm text-gray-500 dark:text-gray-400">
                Explore markets — tap a card to open the chart
              </p>
            </div>

            {/* desktop search */}
            <div className="hidden md:flex items-center gap-3">
              <div className="flex items-center gap-2 bg-gray-100 dark:bg-tertiary rounded-lg px-3 py-2">
                <Search className="w-4 h-4 text-gray-500" />
                <input
                  value={query}
                  onChange={(e) => setQuery(e.target.value)}
                  placeholder="Search markets, coins or symbols..."
                  className="bg-transparent outline-none text-sm w-72 text-gray-700 dark:text-gray-200"
                />
              </div>
            </div>
          </div>

          {/* Tabs */}
          <div className="flex items-center gap-2 overflow-x-auto dark:bg-primary bg-lightbg pb-2 -mx-1">
            <div className="flex gap-2 px-1">
              {categories.map((cat) => (
                <button
                  key={cat}
                  onClick={() => setActiveTab(cat)}
                  className={`whitespace-nowrap px-4 py-2 rounded-full text-sm font-semibold transition-all ${
                    activeTab === cat
                      ? "bg-[var(--color-secondary)] text-black shadow"
                      : "bg-transparent text-gray-400 hover:text-gray-200"
                  }`}
                  aria-pressed={activeTab === cat}
                >
                  <span className="capitalize">{cat}</span>
                </button>
              ))}
            </div>

            {/* mobile search */}
            <div className="ml-auto md:hidden px-1">
              <div className="flex items-center gap-2 bg-gray-100 dark:bg-tertiary rounded-lg px-3 py-2">
                <Search className="w-4 h-4 text-gray-500" />
                <input
                  value={query}
                  onChange={(e) => setQuery(e.target.value)}
                  placeholder="Search"
                  className="bg-transparent outline-none text-sm w-36 text-gray-700 dark:text-gray-200"
                />
              </div>
            </div>
          </div>
        </div>

        {/* content */}
        <div className="mt-4">
          {/* loading skeleton */}
          {loading &&
          (!coinData[activeTab] || coinData[activeTab].length === 0) ? (
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
              {Array.from({ length: 6 }).map((_, i) => (
                <div
                  key={i}
                  className="p-4 rounded-2xl bg-white/30 dark:bg-primary/30 animate-pulse h-28"
                />
              ))}
            </div>
          ) : list.length === 0 ? (
            <div className="p-6 rounded-lg bg-white/10 dark:bg-primary text-center text-red-400">
              No market data found.
            </div>
          ) : (
            <motion.div
              variants={container}
              initial="hidden"
              animate="show"
              className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4"
            >
              {list.map((coin) => {
                const symbol = `${coin.symbol?.toUpperCase()}/USDT`;
                const price = coin.current_price?.toFixed(2) ?? "N/A";
                const change = coin.price_change_percentage_24h ?? 0;
                const changeColor =
                  change >= 0
                    ? "text-[var(--color-secondary)]"
                    : "text-red-500";
                const sell = (coin.current_price * 0.9995).toFixed(2);
                const buy = (coin.current_price * 1.0005).toFixed(2);
                const spread = (buy - sell).toFixed(3);

                // small spark width normalized
                const spark = Math.min(1, Math.abs(change) / 8);

                return (
                  <motion.article
                    key={coin.id}
                    variants={item}
                    className="p-4 rounded-2xl bg-white dark:bg-primary shadow-sm hover:shadow-md transition-colors"
                    whileHover={{ y: -6 }}
                    layout
                  >
                    <div className="flex items-start gap-3">
                      <img
                        src={coin.image}
                        alt={coin.symbol}
                        className="w-11 h-11 rounded-full flex-shrink-0"
                      />
                      <div className="flex-1 min-w-0">
                        <div className="flex items-center justify-between gap-2">
                          <div className="min-w-0">
                            <div className="font-semibold truncate">
                              {coin.name}
                            </div>
                            <div className="text-xs text-gray-400 truncate">
                              {symbol}
                            </div>
                          </div>

                          <div className="text-right ml-2">
                            <div className="text-sm font-bold">{price}</div>
                            <div
                              className={`${changeColor} text-xs font-semibold`}
                            >
                              {change >= 0
                                ? `+${change.toFixed(2)}%`
                                : `${change.toFixed(2)}%`}
                            </div>
                          </div>
                        </div>

                        {/* spark + buy/sell row */}
                        <div className="mt-3 flex items-center justify-between gap-3 flex-wrap">
                          <div className="flex-1 min-w-0 mr-3">
                            <div className="h-2 w-full bg-gray-100 dark:bg-tertiary rounded-full overflow-hidden">
                              <div
                                style={{
                                  width: `${Math.max(6, spark * 100)}%`,
                                  height: "100%",
                                  background:
                                    change >= 0
                                      ? "linear-gradient(90deg,var(--color-secondary),#00d36a)"
                                      : "linear-gradient(90deg,#f87171,#ef4444)",
                                  borderRadius: 9999,
                                  transition: "width 0.4s ease",
                                }}
                              />
                            </div>
                          </div>

                          {/* compact buy/sell mini cards (no absolute elements) */}
                          <div className="flex gap-2 items-center">
                            <Link
                              to={`/chart?pair=${encodeURIComponent(symbol)}`}
                              className="flex-shrink-0"
                            >
                              <div className="flex items-center gap-2 rounded-lg overflow-hidden">
                                <div className="px-3 py-2 bg-red-600 text-black rounded-l-md min-w-[78px] text-xs">
                                  <div className="leading-none">Sell</div>
                                  <div className="font-semibold">{sell}</div>
                                </div>

                                <div className="px-3 py-2 bg-[var(--color-secondary)] text-black rounded-r-md min-w-[78px] text-xs">
                                  <div className="leading-none">Buy</div>
                                  <div className="font-semibold">{buy}</div>
                                </div>
                              </div>
                            </Link>

                            <div className="text-xs text-gray-400 text-right min-w-[56px]">
                              <div>Spread</div>
                              <div className="font-medium">{spread}</div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </motion.article>
                );
              })}
            </motion.div>
          )}
        </div>

        {/* bottom spacer so content doesn't hide behind mobile nav */}
        <div className="h-28 md:h-12" />
      </main>

      <BottomNavbar />
    </div>
  );
}
