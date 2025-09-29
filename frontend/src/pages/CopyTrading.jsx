"use client";

import React, { useMemo, useState } from "react";
import { motion, AnimatePresence } from "framer-motion";
import { Plus, X } from "lucide-react";
import Sidebar from "../components/Sidebar";
import BottomNavbar from "../components/BottomNavbar";
import { Link } from "react-router-dom";

/**
 * CopyTradingSimple.jsx
 *
 * A simplified, responsive, animated Copy Trading page.
 * - Minimal UI to make backend wiring easy
 * - Props (optional): onFollow(traderId, follow:boolean), onInvest(traderId, amount)
 * - Uses small sample dataset by default; replace with backend data easily
 */

const SAMPLE_TRADERS = [
  { id: "t1", name: "LunaTrader", handle: "@lunax", followers: 12840, roi: 48.2, winRate: 78, equity: 15200 },
  { id: "t2", name: "ApexCopy", handle: "@apex", followers: 8930, roi: 21.7, winRate: 61, equity: 8400 },
  { id: "t3", name: "MacroMaven", handle: "@macro", followers: 22300, roi: 82.1, winRate: 83, equity: 48200 },
  { id: "t4", name: "GridPro", handle: "@grid", followers: 5400, roi: 12.0, winRate: 69, equity: 6100 },
  { id: "t5", name: "DeFiQueen", handle: "@defi", followers: 10900, roi: 96.7, winRate: 88, equity: 29200 },
];

function formatNumber(n) {
  if (n >= 1e6) return `${(n / 1e6).toFixed(1)}M`;
  if (n >= 1e3) return `${(n / 1e3).toFixed(1)}k`;
  return `${n}`;
}

export default function CopyTradingSimple({ onFollow, onInvest }) {
  const [tab, setTab] = useState("leaders"); // leaders | explore | following
  const [query, setQuery] = useState("");
  const [traders] = useState(SAMPLE_TRADERS); // replace with backend data
  const [following, setFollowing] = useState({}); // { id: true }
  const [selected, setSelected] = useState(null); // selected trader for modal
  const [investOpen, setInvestOpen] = useState(false);
  const [investAmount, setInvestAmount] = useState("");

  const filtered = useMemo(() => {
    let out = [...traders];
    if (tab === "leaders") out.sort((a, b) => b.followers - a.followers);
    if (tab === "explore") out.sort((a, b) => b.roi - a.roi);
    if (tab === "following") out = out.filter((t) => following[t.id]);
    if (query.trim()) {
      const q = query.toLowerCase();
      out = out.filter((t) => t.name.toLowerCase().includes(q) || t.handle.toLowerCase().includes(q));
    }
    return out;
  }, [traders, tab, query, following]);

  function toggleFollow(id) {
    setFollowing((s) => {
      const next = { ...s };
      const isFollowing = !!next[id];
      if (isFollowing) delete next[id];
      else next[id] = true;

      // call backend hook if provided
      try {
        onFollow && onFollow(id, !isFollowing);
      } catch (err) {
        console.error("onFollow callback error", err);
      }
      return next;
    });
  }

  function openInvest(trader) {
    setSelected(trader);
    setInvestAmount("");
    setInvestOpen(true);
  }

  function confirmInvest() {
    const amount = Number(investAmount) || 0;
    if (amount <= 0) {
      alert("Enter an amount greater than 0");
      return;
    }

    // backend integration point
    try {
      onInvest ? onInvest(selected.id, amount) : alert(`Invested ${amount} to ${selected.name}`);
    } catch (err) {
      console.error("onInvest callback error", err);
    }

    setInvestOpen(false);
    setSelected(null);
    setInvestAmount("");
  }

  const listVariants = { hidden: {}, show: { transition: { staggerChildren: 0.06 } } };
  const cardVariants = { hidden: { opacity: 0, y: 8 }, show: { opacity: 1, y: 0 } };

  return (
    <div className="min-h-screen md:flex bg-lightbg dark:bg-primary text-black dark:text-white">
      <Sidebar />

      <main className="flex-1 px-4 md:px-8 py-6 max-w-6xl mx-auto mt-20 md:mt-30">
        {/* Header */}
        <div className="flex items-center justify-between mb-5">
          <div>
            <h1 className="text-2xl font-semibold">Copy Trading</h1>
            <p className="text-sm text-gray-500 dark:text-gray-400">Follow traders and copy automatically</p>
          </div>

          <div className="flex items-center gap-2">
            <div className="hidden sm:block">
              <input
                value={query}
                onChange={(e) => setQuery(e.target.value)}
                placeholder="Search traders..."
                className="px-3 py-2 rounded-lg bg-gray-100 dark:bg-tertiary text-sm outline-none"
              />
            </div>

            <div className="flex items-center gap-1">
              <button onClick={() => setTab("leaders")} className={`px-3 py-2 rounded-lg text-sm ${tab === "leaders" ? "bg-[var(--color-secondary)] text-black" : "bg-transparent"}`}>Leaders</button>
              <button onClick={() => setTab("explore")} className={`px-3 py-2 rounded-lg text-sm ${tab === "explore" ? "bg-[var(--color-secondary)] text-black" : "bg-transparent"}`}>Explore</button>
              <button onClick={() => setTab("following")} className={`px-3 py-2 rounded-lg text-sm ${tab === "following" ? "bg-[var(--color-secondary)] text-black" : "bg-transparent"}`}>Following</button>
            </div>
          </div>
        </div>

        {/* Traders list */}
        <motion.div variants={listVariants} initial="hidden" animate="show" className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
          {filtered.map((t) => (
            <motion.article
              key={t.id}
              variants={cardVariants}
              whileHover={{ y: -6, boxShadow: "0 12px 30px rgba(0,0,0,0.06)" }}
              className="rounded-2xl bg-white dark:bg-primary p-4"
            >
              <div className="flex items-start justify-between gap-3">
                <div className="flex items-center gap-3 min-w-0">
                  <div className="w-12 h-12 rounded-full bg-gray-200 dark:bg-tertiary flex items-center justify-center font-semibold text-lg">
                    {t.name.charAt(0)}
                  </div>

                  <div className="min-w-0">
                    <div className="font-semibold truncate">{t.name}</div>
                    <div className="text-xs text-gray-400 truncate">{t.handle}</div>
                    <div className="text-xs text-gray-400 mt-1">Strategy • ROI {t.roi}%</div>
                  </div>
                </div>

                <div className="text-right">
                  <div className={`font-semibold ${t.roi >= 0 ? "text-[var(--color-secondary)]" : "text-red-500"}`}>{t.roi}%</div>
                  <div className="text-xs text-gray-400">{formatNumber(t.followers)} followers</div>
                </div>
              </div>

              <div className="mt-4 flex items-center justify-between gap-2">
                <div className="text-sm text-gray-600">Win: <span className="font-semibold">{t.winRate}%</span></div>
                <div className="text-sm text-gray-600">Equity: <span className="font-semibold">${formatNumber(t.equity)}</span></div>
              </div>

              <div className="mt-4 flex items-center gap-2">
                <button
                  onClick={() => toggleFollow(t.id)}
                  className={`flex-1 py-2 rounded-lg text-sm font-semibold ${following[t.id] ? "bg-[var(--color-secondary)] text-black" : "bg-gray-100 dark:bg-tertiary"}`}
                >
                  {following[t.id] ? "Following" : "Follow"}
                </button>

                <button
                  onClick={() => openInvest(t)}
                  className="flex-none px-3 py-2 rounded-lg bg-gradient-to-tr from-secondary  text-white text-sm flex items-center gap-2"
                >
                  <Plus className="w-4 h-4" /> Copy
                </button>
              </div>
            </motion.article>
          ))}
        </motion.div>

        {/* Invest modal (simple, minimal) */}
        <AnimatePresence>
          {investOpen && selected && (
            <motion.div
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              className="fixed inset-0 z-40 grid place-items-center px-3"
              onPointerDown={(e) => {
                if (e.target === e.currentTarget) {
                  setInvestOpen(false);
                  setSelected(null);
                }
              }}
            >
              <div className="absolute inset-0 bg-black/50" />
              <motion.div
                initial={{ y: 12, scale: 0.98 }}
                animate={{ y: 0, scale: 1 }}
                exit={{ y: 12, scale: 0.98, opacity: 0 }}
                transition={{ type: "spring", stiffness: 320, damping: 28 }}
                className="relative w-full max-w-md rounded-2xl bg-white dark:bg-primary p-4"
              >
                <div className="flex items-center justify-between mb-3">
                  <div>
                    <div className="font-semibold">{selected.name}</div>
                    <div className="text-xs text-gray-400">{selected.handle}</div>
                  </div>
                  <button onClick={() => { setInvestOpen(false); setSelected(null); }} className="p-2 rounded-lg dark:bg-primary bg-lightbg"><X className="w-4 h-4" /></button>
                </div>

                <label className="text-sm text-gray-500">Amount (USD)</label>
                <input
                  value={investAmount}
                  onChange={(e) => setInvestAmount(e.target.value)}
                  placeholder="100"
                  className="w-full mt-2 px-3 py-2 rounded-lg bg-gray-100 dark:bg-tertiary"
                />

                <div className="mt-4 flex items-center justify-end gap-2">
                  <button onClick={() => { setInvestOpen(false); setSelected(null); }} className="px-4 py-2 rounded-lg bg-primary bg-lightbg">Cancel</button>
                  <button onClick={confirmInvest} className="px-4 py-2 rounded-lg bg-[var(--color-secondary)] text-black font-semibold">Confirm</button>
                </div>
              </motion.div>
            </motion.div>
          )}
        </AnimatePresence>

        <div className="h-28" />
      </main>

      <BottomNavbar />
    </div>
  );
}
