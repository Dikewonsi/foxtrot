import { useEffect, useRef, useState } from "react";
import { ChevronRight } from "lucide-react";
import { Link } from "react-router-dom";

const COINS = [
  "bitcoin",
  "ethereum",
  "xrp",
  "dogecoin",
  "ethereum-classic",
  "litecoin",
  "cardano",
];

const CACHE_KEY = "coinData";
const CACHE_TS_KEY = "coinDataTimestamp";
const CACHE_TTL = 5 * 60 * 1000; // 5 minutes
const REFRESH_MS = 180000; // 3 minutes
const GAP_PX = 12; // matches space-x-3 (0.75rem)

export default function CoinSlider() {
  const [coins, setCoins] = useState([]);
  const [loading, setLoading] = useState(true);
  const scrollRef = useRef(null);

  // ---- helpers: cache
  const loadFromCache = () => {
    try {
      const raw = localStorage.getItem(CACHE_KEY);
      const ts = parseInt(localStorage.getItem(CACHE_TS_KEY) || "0", 10);
      if (!raw) return null;
      const age = Date.now() - ts;
      const parsed = JSON.parse(raw);
      if (Array.isArray(parsed) && parsed.length) {
        // If fresh enough, use immediately
        if (age < CACHE_TTL) return parsed;
        // Even if stale, return so UI has something until network updates
        return parsed;
      }
    } catch {
      // Intentionally ignore cache errors
    }
    return null;
  };

  const saveToCache = (data) => {
    try {
      localStorage.setItem(CACHE_KEY, JSON.stringify(data));
      localStorage.setItem(CACHE_TS_KEY, Date.now().toString());
    } catch {
      // Intentionally ignore cache errors
    }
  };

  // ---- network
  const fetchCoins = async () => {
    try {
      const url = `https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=${COINS.join(
        ","
      )}&order=market_cap_desc&per_page=${COINS.length}&page=1&sparkline=false`;

      const res = await fetch(url);
      if (!res.ok) throw new Error(`HTTP ${res.status}`);
      const data = await res.json();
      if (Array.isArray(data) && data.length) {
        setCoins(data);
        saveToCache(data);
      }
    } catch (err) {
      console.error("Fetch failed, using cache if available:", err);
      // Only replace state from cache if we have nothing yet
      const cached = loadFromCache();
      if (cached && !coins.length) setCoins(cached);
    } finally {
      setLoading(false);
    }
  };

  // ---- mount: use cache first, then fetch, and auto-refresh
  useEffect(() => {
    const cached = loadFromCache();
    if (cached) {
      setCoins(cached);
      setLoading(false);
    }
    fetchCoins();
    const id = setInterval(fetchCoins, REFRESH_MS);
    return () => clearInterval(id);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  // ---- mobile auto-scroll loop (no Framer Motion)
  useEffect(() => {
    const container = scrollRef.current;
    if (!container || !coins.length) return;

    let index = 0;
    const getCardWidth = () =>
      container.firstChild?.getBoundingClientRect().width || 120;

    const tick = () => {
      const cardWidth = getCardWidth();
      index += 1;
      container.style.scrollBehavior = "smooth";
      container.scrollTo({
        left: index * (cardWidth + GAP_PX),
      });

      // When we reach the duplicated boundary, jump back without visible snap
      if (index >= coins.length) {
        setTimeout(() => {
          container.style.scrollBehavior = "auto";
          index = 0;
          container.scrollLeft = 0;
        }, 350);
      }
    };

    const interval = setInterval(tick, 2500);
    return () => clearInterval(interval);
  }, [coins]);

  if (loading && !coins.length) {
    return (
      <div className="text-center text-gray-400 py-4">Loading coins...</div>
    );
  }

  if (!coins.length) {
    return (
      <div className="text-center text-red-400 py-4">
        Coin data could not be loaded.
      </div>
    );
  }

  // Duplicate for seamless loop on mobile
  const loopCoins = [...coins, ...coins];

  return (
    <>
      {/* Desktop (grid) */}
      <div className="mb-6 hidden md:block bg-lightbg dark:bg-primary p-4 rounded-lg">
        <div className="flex justify-between items-center text-sm mb-2">
          <span className="font-semibold text-black dark:text-white">
            Recommended
          </span>
          <Link to="/market">
            <span className="text-sm text-black dark:text-white flex items-center">
              More <ChevronRight className="w-3 h-3 ml-1" />
            </span>
          </Link>
        </div>

        <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-3 gap-4">
          {coins.map((coin) => {
            const symbol = `${coin.symbol.toUpperCase()}/USDT`;
            const price = coin.current_price.toFixed(2);
            const change = coin.price_change_percentage_24h;
            const changeColor = change >= 0 ? "text-secondary" : "text-red-500";

            return (
              <Link
                to={`/chart?pair=${encodeURIComponent(symbol)}`}
                key={coin.id}
              >
                <div
                  key={coin.id}
                  className="dark:bg-tertiary bg-gray-300 p-4 rounded-lg text-center transform transition hover:scale-105"
                >
                  <p className="text-sm text-black dark:text-white">{symbol}</p>
                  <p className={`${changeColor} text-lg font-semibold`}>
                    ${price}
                  </p>
                  <p className={`${changeColor} text-xs`}>
                    {change.toFixed(2)}%
                  </p>
                </div>
              </Link>
            );
          })}
        </div>
      </div>

      {/* Mobile (auto-scrolling slider) */}
      <div className="mb-2 md:hidden bg-lightbg dark:bg-primary p-4 rounded-lg">
        <div className="flex justify-between items-center text-md mb-2 px-2">
          <span className="font-semibold text-black dark:text-white">
            Recommended
          </span>
          <Link to="/market">
            <span className="text-xs text-gray-400 flex items-center">
              More <ChevronRight className="w-3 h-3 ml-1" />
            </span>
          </Link>
        </div>

        <div
          ref={scrollRef}
          className="flex overflow-x-auto space-x-3 px-2 scrollbar-hide snap-x scroll-smooth"
        >
          {loopCoins.map((coin, i) => {
            const symbol = `${coin.symbol.toUpperCase()}/USDT`;
            const price = coin.current_price.toFixed(2);
            const change = coin.price_change_percentage_24h;
            const changeColor = change >= 0 ? "text-secondary" : "text-red-500";

            return (
              <Link
                to={`/chart?pair=${encodeURIComponent(symbol)}`}
                key={`${coin.id}-${i}`}
              >
                <div
                  key={`${coin.id}-${i}`}
                  className="min-w-[120px] snap-start dark:bg-tertiary bg-gray-300 p-4 rounded-lg text-center"
                >
                  <p className="text-sm text-black dark:text-white">{symbol}</p>
                  <p className={`${changeColor} text-lg font-semibold`}>
                    ${price}
                  </p>
                  <p className={`${changeColor} text-xs`}>
                    {change.toFixed(2)}%
                  </p>
                </div>
              </Link>
            );
          })}
        </div>
      </div>
    </>
  );
}
