"use client";

import React, { useState, useRef, useEffect } from "react";
import { Link, useLocation } from "react-router-dom";
import { motion, AnimatePresence } from "framer-motion";
import {
  Home,
  BarChart2,
  CreditCard,
  MessageSquare,
  Activity,
  Zap,
  Users,
  ChevronRight,
  MoreVertical,
  MoreHorizontal,
} from "lucide-react";

/**
 * BottomNavbar with TWO drop-ups:
 * - Center FAB (existing trading tools)
 * - Right FAB (profile replacement) -> opens Copy Trading / Trading Signals / Trading Bots
 *
 * Mobile-only (md:hidden)
 */

export default function BottomNavbar() {
  const location = useLocation();
  const currentPath = location.pathname;

  // center panel state (keeps your existing center menu)
  const [centerOpen, setCenterOpen] = useState(false);
  const centerRef = useRef(null);

  // right panel state (new requirement)
  const [rightOpen, setRightOpen] = useState(false);
  const rightRef = useRef(null);

  // close when clicking outside either panel
  useEffect(() => {
    function onDoc(e) {
      if (centerRef.current && centerRef.current.contains(e.target)) {
        // clicked inside center panel -> do nothing
      } else {
        // if click is outside center's button/panel, close center
        if (centerOpen && !e.target.closest("#center-fab"))
          setCenterOpen(false);
      }

      if (rightRef.current && rightRef.current.contains(e.target)) {
        // clicked inside right panel -> do nothing
      } else {
        if (rightOpen && !e.target.closest("#right-fab")) setRightOpen(false);
      }
    }
    document.addEventListener("pointerdown", onDoc);
    return () => document.removeEventListener("pointerdown", onDoc);
  }, [centerOpen, rightOpen]);

  // close panels when route changes
  useEffect(() => {
    setCenterOpen(false);
    setRightOpen(false);
  }, [currentPath]);

  const navBtn = (icon, label, active) => (
    <div
      className={`flex flex-col items-center justify-center text-center ${
        active ? "text-[var(--color-secondary)]" : "text-[var(--color-icon)]"
      }`}
    >
      {icon}
      <span className="text-[var(--font-size-nav-size)] mt-1">{label}</span>
    </div>
  );

  const itemVariants = {
    hidden: { y: 18, opacity: 0, scale: 0.98 },
    show: (i = 0) => ({
      y: 0,
      opacity: 1,
      scale: 1,
      transition: {
        delay: i * 0.06,
        type: "spring",
        stiffness: 420,
        damping: 32,
      },
    }),
    exit: { y: 12, opacity: 0, scale: 0.98, transition: { duration: 0.14 } },
  };

  return (
    <nav className="fixed bottom-0 w-full bg-lightbg dark:bg-primary border-t border-[#2C2E33] flex justify-around items-center text-xs py-2 md:hidden z-40">
      {/* Home */}
      <Link
        to="/"
        className="flex flex-col items-center"
        onClick={() => {
          setCenterOpen(false);
          setRightOpen(false);
        }}
      >
        {navBtn(<Home className="w-5 h-5" />, "Home", currentPath === "/")}
      </Link>

      {/* Market */}
      <Link
        to="/market"
        className="flex flex-col items-center"
        onClick={() => {
          setCenterOpen(false);
          setRightOpen(false);
        }}
      >
        {navBtn(
          <BarChart2 className="w-5 h-5" />,
          "Market",
          currentPath === "/market"
        )}
      </Link>

      {/* Center FAB (existing trading tools) */}
      <div className="relative flex items-center justify-center -mt-6">
        <button
          id="center-fab"
          onClick={() => {
            setCenterOpen((s) => !s);
            // close other panel
            setRightOpen(false);
          }}
          aria-expanded={centerOpen}
          aria-controls="center-trade-panel"
          className="group relative z-10 p-3 rounded-full shadow-2xl bg-[var(--color-secondary)] flex items-center justify-center focus:outline-none"
          title="Trading tools"
        >
          <motion.div whileTap={{ scale: 0.94 }} whileHover={{ rotate: -6 }}>
            <CreditCard className="w-5 h-5 text-black" />
          </motion.div>

          <motion.span
            aria-hidden
            initial={{ scale: 0.9, opacity: 0.12 }}
            animate={{
              scale: centerOpen ? 1.15 : 0.9,
              opacity: centerOpen ? 0.14 : 0.06,
            }}
            transition={{ duration: 0.5 }}
            className="absolute inset-0 rounded-full bg-[var(--color-secondary)]/40 blur-sm"
          />
        </button>

        <AnimatePresence>
          {centerOpen && (
            <motion.div
              id="center-trade-panel"
              ref={centerRef}
              initial={{ y: 18, opacity: 0 }}
              animate={{ y: 0, opacity: 1 }}
              exit={{ y: 18, opacity: 0 }}
              transition={{ type: "spring", stiffness: 320, damping: 28 }}
              className="absolute bottom-20 left-1/2 transform -translate-x-1/2 z-50 flex flex-col items-center space-y-3"
              style={{ pointerEvents: centerOpen ? "auto" : "none" }}
            >
              <motion.div
                variants={itemVariants}
                initial="hidden"
                animate="show"
                exit="exit"
                custom={0}
                className="w-56 max-w-[86vw]"
              >
                <Link to="/crypto-trade" onClick={() => setCenterOpen(false)}>
                  <div className="flex items-center gap-3 px-4 py-3 rounded-xl bg-white dark:bg-[var(--color-navbar)] shadow-lg border border-gray-100 dark:border-gray-800">
                    <div className="w-10 h-10 rounded-lg grid place-items-center bg-gradient-to-tr from-yellow-200 to-yellow-400">
                      <Activity className="w-5 h-5" />
                    </div>
                    <div className="flex-1 text-left">
                      <div className="font-medium">Crypto trading</div>
                      <div className="text-xs text-gray-400">
                        Spot & limit orders
                      </div>
                    </div>
                    <ChevronRight className="w-4 h-4 text-gray-400" />
                  </div>
                </Link>
              </motion.div>

              <motion.div
                variants={itemVariants}
                initial="hidden"
                animate="show"
                exit="exit"
                custom={1}
                className="w-56 max-w-[86vw]"
              >
                <Link to="/trade/stocks" onClick={() => setCenterOpen(false)}>
                  <div className="flex items-center gap-3 px-4 py-3 rounded-xl bg-white dark:bg-[var(--color-navbar)] shadow-lg border border-gray-100 dark:border-gray-800">
                    <div className="w-10 h-10 rounded-lg grid place-items-center bg-gradient-to-tr from-blue-200 to-blue-400">
                      <BarChart2 className="w-5 h-5" />
                    </div>
                    <div className="flex-1 text-left">
                      <div className="font-medium">Stocks trading</div>
                      <div className="text-xs text-gray-400">
                        Equities & ETFs
                      </div>
                    </div>
                    <ChevronRight className="w-4 h-4 text-gray-400" />
                  </div>
                </Link>
              </motion.div>

              <motion.div
                variants={itemVariants}
                initial="hidden"
                animate="show"
                exit="exit"
                custom={2}
                className="w-56 max-w-[86vw]"
              >
                <Link
                  to="/trade/commodities"
                  onClick={() => setCenterOpen(false)}
                >
                  <div className="flex items-center gap-3 px-4 py-3 rounded-xl bg-white dark:bg-[var(--color-navbar)] shadow-lg border border-gray-100 dark:border-gray-800">
                    <div className="w-10 h-10 rounded-lg grid place-items-center bg-gradient-to-tr from-pink-200 to-pink-400">
                      <Zap className="w-5 h-5" />
                    </div>
                    <div className="flex-1 text-left">
                      <div className="font-medium">Commodity trading</div>
                      <div className="text-xs text-gray-400">
                        Gold, oil & more
                      </div>
                    </div>
                    <ChevronRight className="w-4 h-4 text-gray-400" />
                  </div>
                </Link>
              </motion.div>
            </motion.div>
          )}
        </AnimatePresence>
      </div>

      {/* Messages */}
      <Link
        to="/message"
        className="flex flex-col items-center"
        onClick={() => {
          setCenterOpen(false);
          setRightOpen(false);
        }}
      >
        {navBtn(
          <MessageSquare className="w-5 h-5" />,
          "Messages",
          currentPath === "/message"
        )}
      </Link>

      {/* RIGHT FAB — replaces profile link and opens Copy Trading / Signals / Bots */}
      <div className="relative flex items-center justify-center -mt-3">
        <button
          id="right-fab"
          onClick={() => {
            setRightOpen((s) => !s);
            // ensure center panel closed when opening right panel
            setCenterOpen(false);
          }}
          aria-expanded={rightOpen}
          aria-controls="right-trade-panel"
          className="group relative  p-3 rounded-full shadow-2xl bg-white dark:bg-primary flex items-center justify-center focus:outline-none"
          title="More tools"
        >
          <motion.div whileTap={{ scale: 0.94 }} whileHover={{ rotate: 6 }}>
            {/* Three-dot "More" icon instead of User */}
            <MoreHorizontal className="w-5 h-5 text-[var(--color-secondary)]" />
          </motion.div>
        </button>

        <AnimatePresence>
          {rightOpen && (
            <motion.div
              id="right-trade-panel"
              ref={rightRef}
              initial={{ y: 18, opacity: 0 }}
              animate={{ y: 0, opacity: 1 }}
              exit={{ y: 18, opacity: 0 }}
              transition={{ type: "spring", stiffness: 320, damping: 28 }}
              className="absolute bottom-20 right-4 z-50 flex flex-col items-end space-y-3"
              style={{ pointerEvents: rightOpen ? "auto" : "none" }}
            >
              {/* Copy Trading */}
              <motion.div
                variants={itemVariants}
                custom={0}
                initial="hidden"
                animate="show"
                exit="exit"
                className="w-56 max-w-[86vw]"
              >
                <Link to="/copy-trading" onClick={() => setRightOpen(false)}>
                  <div className="flex items-center gap-3 px-4 py-3 rounded-xl bg-white dark:bg-[var(--color-navbar)] shadow-lg border border-gray-100 dark:border-gray-800">
                    <div className="w-10 h-10 rounded-lg grid place-items-center bg-gradient-to-tr from-indigo-100 to-indigo-300">
                      <Users className="w-5 h-5" />
                    </div>
                    <div className="flex-1 text-left">
                      <div className="font-medium">Copy Trading</div>
                      <div className="text-xs text-gray-400">
                        Follow pro traders
                      </div>
                    </div>
                    <ChevronRight className="w-4 h-4 text-gray-400" />
                  </div>
                </Link>
              </motion.div>

              {/* Trading Signals */}
              <motion.div
                variants={itemVariants}
                custom={1}
                initial="hidden"
                animate="show"
                exit="exit"
                className="w-56 max-w-[86vw]"
              >
                <Link to="/trading-signals" onClick={() => setRightOpen(false)}>
                  <div className="flex items-center gap-3 px-4 py-3 rounded-xl bg-white dark:bg-[var(--color-navbar)] shadow-lg border border-gray-100 dark:border-gray-800">
                    <div className="w-10 h-10 rounded-lg grid place-items-center bg-gradient-to-tr from-pink-100 to-pink-300">
                      <Zap className="w-5 h-5" />
                    </div>
                    <div className="flex-1 text-left">
                      <div className="font-medium">Trading Signals</div>
                      <div className="text-xs text-gray-400">
                        Buy/sell alerts
                      </div>
                    </div>
                    <ChevronRight className="w-4 h-4 text-gray-400" />
                  </div>
                </Link>
              </motion.div>

              {/* Trading Bots */}
              <motion.div
                variants={itemVariants}
                custom={2}
                initial="hidden"
                animate="show"
                exit="exit"
                className="w-56 max-w-[86vw]"
              >
                <Link to="/trading-bots" onClick={() => setRightOpen(false)}>
                  <div className="flex items-center gap-3 px-4 py-3 rounded-xl bg-white dark:bg-[var(--color-navbar)] shadow-lg border border-gray-100 dark:border-gray-800">
                    <div className="w-10 h-10 rounded-lg grid place-items-center bg-gradient-to-tr from-green-100 to-green-300">
                      <Activity className="w-5 h-5" />
                    </div>
                    <div className="flex-1 text-left">
                      <div className="font-medium">Trading Bots</div>
                      <div className="text-xs text-gray-400">
                        Automated strategies
                      </div>
                    </div>
                    <ChevronRight className="w-4 h-4 text-gray-400" />
                  </div>
                </Link>
              </motion.div>
            </motion.div>
          )}
        </AnimatePresence>
      </div>
    </nav>
  );
}
