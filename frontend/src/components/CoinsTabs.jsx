
import { useState, useEffect } from "react";

const categories = ["Forex", "Index", "Commodities", "Crypto"];
const CACHE_KEY = "coinTabsCache";
const CACHE_TTL = 30 * 60 * 1000; // 30 minutes

export default function CoinTabs() {
  const [activeTab, setActiveTab] = useState("signal");
  const [activeCategory, setActiveCategory] = useState("Forex");
  const [signalsData, setSignalsData] = useState({});
  const [marketNews, setMarketNews] = useState([]);
  
  //  Use env variable (Vite: import.meta.env.VITE_NEWS_API_KEY, CRA: process.env.REACT_APP_NEWS_API_KEY)
  const apiKey = import.meta.env.VITE_NEWS_API_KEY || "YOUR_FALLBACK_API_KEY";

  useEffect(() => {
    const fetchData = async () => {
      try {
        //  check local cache
        const cached = localStorage.getItem(CACHE_KEY);
        if (cached) {
          const parsed = JSON.parse(cached);
          if (Date.now() - parsed.timestamp < CACHE_TTL) {
            setSignalsData(parsed.signalsData);
            setMarketNews(parsed.marketNews);
            return;
          }
        }

        // 🔄 fetch new signals
        const signalPromises = categories.map(async (cat) => {
          const res = await fetch(
            `https://newsdata.io/api/1/news?apikey=${apiKey}&q=${cat.toLowerCase()}&language=en&category=business`
          );
          const data = await res.json();
          return { [cat]: data.results?.slice(0, 5) || [] };
        });

        const marketRes = await fetch(
          `https://newsdata.io/api/1/news?apikey=${apiKey}&q=${encodeURIComponent(
            "stock market OR economic OR inflation OR interest rates"
          )}&language=en&category=business`
        );
        const marketData = await marketRes.json();

        const signals = await Promise.all(signalPromises);
        const mergedSignals = Object.assign({}, ...signals);
        const market = marketData.results?.slice(0, 5) || [];

        //  save to state
        setSignalsData(mergedSignals);
        setMarketNews(market);

        //  save to cache
        localStorage.setItem(
          CACHE_KEY,
          JSON.stringify({
            signalsData: mergedSignals,
            marketNews: market,
            timestamp: Date.now(),
          })
        );
      } catch (err) {
        console.error("Error fetching news:", err);
      }
    };

    fetchData();
  }, [apiKey]);

  return (
    <div className="bg-lightbg dark:bg-primary py-2 ">
      {/* Tabs */}
      <div className="mb-4 px-4">
        <div className="flex gap-6 text-md border-b border-tertiary pb-2">
          <button
            onClick={() => setActiveTab("signal")}
            className={`tab-btn ${
              activeTab === "signal"
                ? "text-black dark:text-white font-semibold border-b-2 border-secondary"
                : "text-gray-400"
            }`}
          >
            Signal
          </button>
          <button
            onClick={() => setActiveTab("market")}
            className={`tab-btn ${
              activeTab === "market"
                ? "text-black dark:text-white font-semibold border-b-2 border-secondary"
                : "text-gray-400"
            }`}
          >
            Market Analysis
          </button>
        </div>
      </div>

      {/* Signal Tags */}
      {activeTab === "signal" && (
        <div className="flex flex-wrap gap-2 text-sm mb-3 px-4">
          {categories.map((cat) => (
            <button
              key={cat}
              onClick={() => setActiveCategory(cat)}
              className={`tag-btn px-3 py-1 rounded-full ${
                activeCategory === cat
                  ? "text-black dark:text-white"
                  : "dark:bg-tertiary bg-gray-300 text-gray-200"
              }`}
            >
              {cat}
            </button>
          ))}
        </div>
      )}

      {/* Signal Content */}
      {activeTab === "signal" && (
        <div className="px-4 space-y-6">
          {(signalsData[activeCategory] || []).map((article, i) => (
            <div key={i} className="rounded-lg p-4 bg-lightbg dark:bg-primary">
              <h2 className="text-black dark:text-white text-xl font-semibold mb-1">
                {article.title?.slice(0, 50) || "No news"}
              </h2>
              <p className="text-gray-400 text-sm mb-4">
                {article.description?.slice(0, 50) || "No description"}
                {article.link && (
                  <a
                    href={article.link}
                    target="_blank"
                    rel="noreferrer"
                    className="text-secondary hover:underline text-xs ml-1"
                  >
                    Read more
                  </a>
                )}
              </p>
              {article.image_url && (
                <img
                  src={article.image_url}
                  alt=""
                  className="w-full rounded mb-3"
                />
              )}
              <p className="text-xs text-gray-500">
                {article.pubDate
                  ? new Date(article.pubDate).toLocaleString()
                  : ""}
              </p>
            </div>
          ))}
        </div>
      )}

      {/* Market Tab */}
      {activeTab === "market" && (
        <div className="px-4 space-y-2">
          {marketNews.length > 0 ? (
            marketNews.map((article, i) => (
              <a
                key={i}
                href={article.link}
                target="_blank"
                rel="noreferrer"
                className="block hover:bg-secondary hover:bg-opacity-10 transition rounded"
              >
                <div className="p-3 rounded">
                  <h3 className="text-black dark:text-white text-sm font-semibold">
                    {article.title || "No title"}
                  </h3>
                  <p className="text-gray-500 text-xs">
                    {article.pubDate
                      ? new Date(article.pubDate).toLocaleString()
                      : ""}
                  </p>
                </div>
              </a>
            ))
          ) : (
            <p className="text-gray-400 text-sm">No market news available.</p>
          )}
        </div>
      )}
    </div>
  );
}
