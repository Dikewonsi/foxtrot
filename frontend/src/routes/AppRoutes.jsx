// src/routes/AppRoutes.jsx
import { Routes, Route } from "react-router-dom";
import Layout from "../Layout";
import Home from "../pages/Home";
import Market from "../pages/Market";
import Chart from "../pages/Chart";
import Messages from "../pages/Messages";
import DepositPage from "../pages/Deposit";
import WithdrawPage from "../pages/Withdraw";
import AccountPage from "../pages/Account";
import LoginPage from "../pages/Login";
import CopyTradingPage from "../pages/CopyTrading";
import StockPage from "../pages/Stocks";
import RegisterPage from "../pages/Register";
import NotificationsPage from "../pages/Notifications";
import PrivateRoute from "../components/PrivateRoute";

export default function AppRoutes() {
  return (
    <Routes>
      {/* Public routes */}
      <Route path="/login" element={<LoginPage />} />
      <Route path="/register" element={<RegisterPage />} />

      {/* Protected routes */}
      <Route
        path="/"
        element={
          <PrivateRoute>
            <Layout><Home /></Layout>
          </PrivateRoute>
        }
      />
      <Route
        path="/market"
        element={
          <PrivateRoute>
            <Layout><Market /></Layout>
          </PrivateRoute>
        }
      />
      <Route
        path="/chart"
        element={
          <PrivateRoute>
            <Layout><Chart /></Layout>
          </PrivateRoute>
        }
      />
      <Route
        path="/message"
        element={
          <PrivateRoute>
            <Layout><Messages /></Layout>
          </PrivateRoute>
        }
      />
      <Route
        path="/deposit"
        element={
          <PrivateRoute>
            <Layout><DepositPage /></Layout>
          </PrivateRoute>
        }
      />
      <Route
        path="/withdraw"
        element={
          <PrivateRoute>
            <Layout><WithdrawPage /></Layout>
          </PrivateRoute>
        }
      />
      <Route
        path="/account"
        element={
          <PrivateRoute>
            <Layout><AccountPage /></Layout>
          </PrivateRoute>
        }
      />
      <Route
        path="/notifications"
        element={
          <PrivateRoute>
            <Layout><NotificationsPage /></Layout>
          </PrivateRoute>
        }
      />
      <Route
        path="/copy-trading"
        element={
          <PrivateRoute>
            <Layout><CopyTradingPage /></Layout>
          </PrivateRoute>
        }
      />
      <Route
        path="/stock"
        element={
          <PrivateRoute>
            <Layout><StockPage /></Layout>
          </PrivateRoute>
        }
      />
    </Routes>
  );
}
