/** @format */

import React, { useState } from "react";
import { motion } from "framer-motion";
import { Mail, Lock, Eye, EyeOff } from "lucide-react";
import ThemeToggle from "../components/ThemeToggle";
import { useNavigate } from "react-router-dom";
import { toast } from "react-toastify";



// If you use Next.js and want to use next/image or next/link replace the
// <img> and <a> tags accordingly.

export default function LoginPage() {
  const navigate = useNavigate();
  
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [showPassword, setShowPassword] = useState(false);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  function validate() {
    if (!email.includes("@")) return "Please enter a valid email.";
    if (password.length < 6) return "Password must be at least 6 characters.";
    return "";
  }

  async function handleSubmit(e) {
    e.preventDefault();
    setError("");
    const validationErr = validate();
    if (validationErr) return setError(validationErr);

    try {
      setLoading(true);

      const res = await fetch("http://127.0.0.1:8001/api/login", {
        method: "POST",
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          email,
          password,
        }),
      });

      if (res.ok) {
        const data = await res.json();
        localStorage.setItem("authToken", data.token);
        localStorage.setItem("user", JSON.stringify(data.user));

        toast.success(`Welcome back, ${data.user.f_name}! 🎉`);
        navigate("/");
      } else {
        const error = await res.json();
        toast.error(error.message || "Invalid credentials");
      }
    } catch (err) {
      toast.error("Something went wrong. Try again.");
    } finally {
      setLoading(false);
    }
  }

  return (
    <div className="min-h-screen flex items-center justify-center bg-[color:var(--color-lightbg)] dark:bg-gray-900 transition-colors duration-300">
      {/* Background layers */}
      <div className="absolute inset-0 overflow-hidden pointer-events-none">
        <motion.img
          alt="bg"
          className="w-full h-full object-cover opacity-40 dark:opacity-20"
          initial={{ scale: 1.15 }}
          animate={{ scale: 1.08 }}
          transition={{ duration: 12, yoyo: Infinity }}
        />
        <div className="absolute inset-0 bg-gradient-to-b from-transparent via-white/40 to-white/70 dark:via-black/40 dark:to-black/70 mix-blend-multiply" />
      </div>

      <motion.div
        initial={{ opacity: 0, y: 30 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.5 }}
        className="relative z-10 w-full max-w-4xl mx-4 md:mx-8 rounded-3xl shadow-2xl overflow-hidden bg-white dark:bg-[color:var(--color-primary)]"
      >
        <div className="md:flex">
          {/* Left visual panel */}
          <div className="md:flex md:w-1/2 items-center justify-center p-10 bg-gradient-to-tr from-slate-50 to-white dark:from-[color:var(--color-primary)] dark:to-[color:var(--color-tertiary)]">
            <motion.div
              initial={{ x: -20, opacity: 0 }}
              animate={{ x: 0, opacity: 1 }}
              transition={{ delay: 0.2 }}
              className="space-y-6 px-6"
            >
              <h2 className="text-3xl font-extrabold text-[color:var(--color-primary)] dark:text-white">
                Welcome back
              </h2>
              <p className="text-sm text-gray-600 dark:text-gray-300 max-w-xs">
                Sign in to continue to your dashboard. We keep your data safe
                and provide neat tools to manage your workflow.
              </p>

              <div className="flex items-center gap-3 mt-4 hidden md:block">
                <div className="h-12 w-12 rounded-xl bg-white/60 dark:bg-white/5 grid place-items-center shadow-sm">
                  <svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M12 3v6l4-4" stroke="#10B981" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
                    <circle cx="12" cy="12" r="8" stroke="#10B981" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
                  </svg>
                </div>
                <div>
                  <p className="  text-xs text-gray-500 dark:text-gray-300">Quick tips</p>
                  <p className="  text-sm font-medium text-[color:var(--color-primary)] dark:text-white">Use your work email to get best experience</p>
                </div>
              </div>
            </motion.div>
          </div>

          {/* Right form panel */}
          <div className="w-full md:w-1/2 p-8 md:p-12">
            <div className="max-w-md mx-auto">
              <div className="flex items-center justify-between mb-6">
                <div>
                  <h3 className="text-2xl font-bold text-[color:var(--color-primary)] dark:text-white">Sign in</h3>
                  <p className="text-sm text-gray-500 dark:text-gray-400">Nice to see you again — please enter your details.</p>
                </div>

                <motion.div
                  whileHover={{ scale: 1.07 }}
                  className="sm:flex items-center gap-2 px-3 py-2 rounded-full bg-gray-100 dark:bg-black/20"
                >
                  <span className="text-xs text-gray-500 dark:text-gray-300"><ThemeToggle/></span>
                  
                </motion.div>
              </div>

              <form onSubmit={handleSubmit} className="space-y-4">
                {/* Email */}
                <motion.label
                  initial={{ opacity: 0 }}
                  animate={{ opacity: 1 }}
                  transition={{ delay: 0.05 }}
                  className="block"
                >
                  <span className="text-xs font-medium text-gray-600 dark:text-gray-300 flex items-center gap-2">
                    <Mail className="w-4 h-4" /> Email
                  </span>

                  <input
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    placeholder="you@company.com"
                    type="email"
                    required
                    className="mt-2 w-full px-4 py-3 rounded-lg border border-gray-200 dark:border-gray-700 focus:outline-none focus:ring-2 focus:ring-[color:var(--color-secondary)] bg-white dark:bg-transparent text-[color:var(--color-primary)] dark:text-white"
                  />
                </motion.label>

                {/* Password */}
                <motion.label
                  initial={{ opacity: 0 }}
                  animate={{ opacity: 1 }}
                  transition={{ delay: 0.1 }}
                  className="block relative"
                >
                  <span className="text-xs font-medium text-gray-600 dark:text-gray-300 flex items-center gap-2">
                    <Lock className="w-4 h-4" /> Password
                  </span>

                  <input
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    placeholder="Your password"
                    type={showPassword ? "text" : "password"}
                    required
                    className="mt-2 w-full px-4 py-3 rounded-lg border border-gray-200 dark:border-gray-700 focus:outline-none focus:ring-2 focus:ring-[color:var(--color-secondary)] bg-white dark:bg-transparent text-[color:var(--color-primary)] dark:text-white pr-12"
                  />

                  <button
                    type="button"
                    onClick={() => setShowPassword((v) => !v)}
                    className="absolute right-3 top-11 text-gray-500 dark:text-gray-300"
                    aria-label={showPassword ? "Hide password" : "Show password"}
                  >
                    {showPassword ? <EyeOff className="w-4 h-4" /> : <Eye className="w-4 h-4" />}
                  </button>
                </motion.label>

                {/* Remember / Forgot */}
                <div className="flex items-center justify-between text-sm text-gray-600 dark:text-gray-300">
                  <label className="flex items-center gap-2">
                    <input type="checkbox" className="h-4 w-4 rounded text-green-500 focus:ring-green-400" />
                    <span>Remember me</span>
                  </label>

                  <a href="#" className="hover:underline">
                    Forgot password?
                  </a>
                </div>

                {/* Error */}
                {error && <p className="text-xs text-red-500">{error}</p>}

                {/* Submit */}
                <motion.button
                  whileTap={{ scale: 0.99 }}
                  type="submit"
                  className="w-full flex items-center justify-center gap-3 px-4 py-3 rounded-lg bg-[color:var(--color-secondary)] text-black font-semibold shadow-md hover:brightness-95 disabled:opacity-60"
                  disabled={loading}
                >
                  <motion.span
                    initial={{ x: -6, opacity: 0 }}
                    animate={{ x: 0, opacity: 1 }}
                    transition={{ delay: 0.05 }}
                  >
                    Sign in
                  </motion.span>
                  {loading && (
                    <svg className="w-4 h-4 animate-spin" viewBox="0 0 24 24">
                      <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" fill="none"></circle>
                      <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8v4l3-3-3-3v4a8 8 0 00-8 8z"></path>
                    </svg>
                  )}
                </motion.button>

                

                {/* Register CTA */}
                <p className="text-center text-sm text-gray-600 dark:text-gray-300">
                  Don't have an account yet?{' '}
                  <a href="/register" className="font-semibold text-[color:var(--color-primary)] dark:text-white underline">
                    Register
                  </a>
                </p>
              </form>

              {/* Tiny footer */}
              <div className="mt-6 text-xs text-gray-500 text-center">
                By continuing you agree to our <a href="#" className="underline">Terms</a> and <a href="#" className="underline">Privacy</a>.
              </div>
            </div>
          </div>
        </div>
      </motion.div>
    </div>
  );
}
