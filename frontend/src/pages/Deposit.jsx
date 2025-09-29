/** DepositPageModernV2.jsx **/
import { useState, useMemo, useCallback } from "react";
import { AnimatePresence, motion } from "framer-motion";
import DepositModal from "../components/DepositModal"; // unchanged (uses props)
import QRDepositModal from "../components/QRDepositModal"; // unchanged (expects amount prop)
import Sidebar from "../components/Sidebar";
import BottomNavbar from "../components/BottomNavbar";

import btc from "../assets/images/crypto-logos/btc.png";
import USDTtrc20 from "../assets/images/crypto-logos/USDT-TRC20.png";
import USDTerc20 from "../assets/images/crypto-logos/erc20.png";

const methods = [
  { icon: "https://cdn-icons-png.flaticon.com/128/3446/3446709.png", name: "Bank Transfer 1", desc: "Safe and Secure, Quick Deposit" },
  { icon: "https://cdn-icons-png.flaticon.com/128/5968/5968778.png", name: "Palmpay", desc: "Safe and Secure, Quick Deposit" },
  { icon: btc, name: "Bitcoin", desc: "Only Transfer Bitcoin" },
  { icon: USDTtrc20, name: "Tether(TRC20)", desc: "Send only TRC20 USDT" },
  { icon: USDTerc20, name: "Tether(ERC20)", desc: "Send only ERC20 USDT" },
];

// Sample transaction data (replace with real API data)
const sampleHistory = new Array(12).fill(null).map((_, i) => ({
  id: i + 1,
  ref: `TX-${20250900 + i}`,
  method: ["Bitcoin", "Palmpay", "Tether(TRC20)"][i % 3],
  amount: (Math.random() * 500 + 10).toFixed(2),
  status: ["Completed", "Pending", "Failed"][i % 3],
  date: new Date(Date.now() - i * 86400000).toISOString().split("T")[0],
}));

export default function DepositPageModernV2() {
  const [selectedMethod, setSelectedMethod] = useState(null);
  const [modal, setModal] = useState(null); // null | 'deposit' | 'qr'

  // NEW: amount state lifted to page so DepositModal and QR modal can share
  const [amount, setAmount] = useState(""); // keep as string to allow blank input; convert when needed

  // transaction table state
  const [query, setQuery] = useState("");
  const [statusFilter, setStatusFilter] = useState("all");
  const [page, setPage] = useState(1);
  const pageSize = 6;

  const history = useMemo(() => sampleHistory, []);

  const filtered = useMemo(() => {
    const q = query.trim().toLowerCase();
    return history.filter((r) => {
      if (statusFilter !== "all" && r.status.toLowerCase() !== statusFilter) return false;
      if (!q) return true;
      return [r.ref, r.method, r.date, r.amount].some((v) => String(v).toLowerCase().includes(q));
    });
  }, [history, query, statusFilter]);

  const pages = Math.max(1, Math.ceil(filtered.length / pageSize));
  const paginated = filtered.slice((page - 1) * pageSize, page * pageSize);

  const onSelectMethod = useCallback((m) => {
    setSelectedMethod(m);
    // reset amount when opening a new method if you prefer
    setAmount("");
    setModal("deposit");
  }, []);

  return (
    <div className="md:flex">
      <Sidebar />

      <motion.main
        initial={{ opacity: 0, y: 8 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.36 }}
        className="flex-1 p-4 md:px-10 dark:text-white text-black min-h-screen pt-[100px]"
      >
        {/* Header */}
        <div className="flex items-start justify-between gap-4 mb-6">
          <div>
            <h1 className="text-2xl font-bold">Deposit</h1>
            <p className="text-sm text-gray-500 dark:text-gray-300">Choose a method to top up. Amounts are entered in the next step.</p>
          </div>

          <div className="flex items-center gap-3">
            <div className="hidden sm:flex flex-col text-right">
              <span className="text-xs text-gray-400">Recent activity</span>
              <span className="font-medium">{history.length} transactions</span>
            </div>
          </div>
        </div>

        {/* Grid of methods (no amount input under cards) */}
        <motion.div layout className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 mb-8">
          {methods.map((m, i) => (
            <motion.button
              key={m.name}
              layout
              whileHover={{ scale: 1.03 }}
              whileTap={{ scale: 0.98 }}
              initial={{ opacity: 0, y: 6 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: i * 0.04 }}
              onClick={() => onSelectMethod(m)}
              className="group flex flex-col justify-between p-4 rounded-2xl bg-white dark:bg-[color:var(--color-primary)] border border-gray-100 dark:border-gray-800 shadow-sm hover:shadow-lg text-left"
            >
              <div className="flex items-center gap-3">
                <img src={m.icon} alt={m.name} className="w-12 h-12 object-contain rounded-md" />
                <div>
                  <div className="font-semibold text-lg text-[color:var(--color-primary)] dark:text-white">{m.name}</div>
                  <div className="text-sm text-gray-500 dark:text-gray-300">{m.desc}</div>
                </div>
              </div>

              <div className="mt-4 flex items-center justify-between">
                <div className="text-xs text-gray-400">Click to continue</div>
                <div className="text-gray-300 group-hover:text-[color:var(--color-primary)]">›</div>
              </div>
            </motion.button>
          ))}
        </motion.div>

        {/* Transaction Table */}
        <div className="bg-transparent rounded-2xl">
          <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4 mb-3">
            <div className="flex items-center gap-3 w-full md:w-1/2">
              <input
                value={query}
                onChange={(e) => { setQuery(e.target.value); setPage(1); }}
                placeholder="Search by ref, method, amount or date"
                className="w-full px-3 py-2 rounded-lg border border-gray-200 dark:border-gray-700 bg-white dark:bg-transparent focus:ring-2 focus:ring-[color:var(--color-secondary)]"
              />

              <select
                value={statusFilter}
                onChange={(e) => { setStatusFilter(e.target.value); setPage(1); }}
                className="px-3 py-2 rounded-lg border border-gray-200 dark:border-gray-700 bg-white dark:bg-transparent"
              >
                <option value="all">All statuses</option>
                <option value="completed">Completed</option>
                <option value="pending">Pending</option>
                <option value="failed">Failed</option>
              </select>
            </div>

            <div className="text-sm text-gray-500">Showing <span className="font-medium">{filtered.length}</span> results</div>
          </div>

          <div className="overflow-x-auto rounded-2xl border border-gray-200 dark:border-gray-700 shadow-sm">
            <table className="min-w-full text-sm">
              <thead className="bg-gray-50 dark:bg-gray-800">
                <tr>
                  <th className="px-4 py-3 text-left font-medium">Ref</th>
                  <th className="px-4 py-3 text-left font-medium">Method</th>
                  <th className="px-4 py-3 text-left font-medium">Amount</th>
                  <th className="px-4 py-3 text-left font-medium">Status</th>
                  <th className="px-4 py-3 text-left font-medium">Date</th>
                </tr>
              </thead>

              <tbody className="divide-y divide-gray-100 dark:divide-gray-700 bg-white dark:bg-transparent">
                {paginated.map((tx) => (
                  <motion.tr key={tx.id} initial={{ opacity: 0, y: 6 }} animate={{ opacity: 1, y: 0 }} transition={{ duration: 0.25 }}>
                    <td className="px-4 py-3 font-mono text-xs">{tx.ref}</td>
                    <td className="px-4 py-3">{tx.method}</td>
                    <td className="px-4 py-3 font-semibold">${tx.amount}</td>
                    <td className="px-4 py-3">
                      <span className={`px-2 py-1 rounded-full text-xs font-semibold ${tx.status === 'Completed' ? 'bg-green-100 text-green-600' : tx.status === 'Pending' ? 'bg-yellow-100 text-yellow-600' : 'bg-red-100 text-red-600'}`}>
                        {tx.status}
                      </span>
                    </td>
                    <td className="px-4 py-3 text-gray-500">{tx.date}</td>
                  </motion.tr>
                ))}
              </tbody>
            </table>
          </div>

          {/* Pagination */}
          <div className="mt-3 flex items-center justify-between text-sm">
            <div className="text-gray-500">Page {page} of {pages}</div>
            <div className="flex items-center gap-2">
              <button onClick={() => setPage((p) => Math.max(1, p - 1))} className="px-3 py-1 rounded-lg border border-secondary">Prev</button>
              <button onClick={() => setPage((p) => Math.min(pages, p + 1))} className="px-3 py-1 rounded-lg border border-secondary">Next</button>
            </div>
          </div>
        </div>

        {/* Modals */}
        <AnimatePresence mode="wait">
          {modal === 'deposit' && (
            <motion.div key="deposit" initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }}>
              <DepositModal
                method={selectedMethod}
                amount={amount}
                setAmount={setAmount}
                onClose={() => setModal(null)}
                onConfirm={() => setModal('qr')}
              />
            </motion.div>
          )}

          {modal === 'qr' && (
            <motion.div key="qr" initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }}>
              <QRDepositModal
                method={selectedMethod}
                amount={amount}
                onBack={() => setModal('deposit')}
                onClose={() => setModal(null)}
              />
            </motion.div>
          )}
        </AnimatePresence>
      </motion.main>

      <BottomNavbar />
    </div>
  );
}
