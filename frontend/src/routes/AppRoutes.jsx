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
import RegisterPage from "../pages/Register"
import NotificationsPage from "../pages/Notifications";

export default function AppRoutes() {
  return (
    <Routes>
      <Route path="/" element={<Layout> <Home /> </Layout>} />     
      <Route path="/market" element={<Layout> <Market/> </Layout>} />
      <Route path="/trade/crypto" element={<Layout><Chart /></Layout>} />
      <Route path="/message" element={<Layout><Messages/></Layout>} />
      <Route path="/deposit" element={<Layout><DepositPage/></Layout>} />
      <Route path="/withdraw" element={<Layout><WithdrawPage/></Layout>} />
      <Route path="/account" element={<Layout> <AccountPage/> </Layout>} />
      <Route path="/login" element={<Layout> <LoginPage/> </Layout>} />
      <Route path="/register" element={<Layout> <RegisterPage/> </Layout>} />
      <Route path="/notifications" element={<Layout> <NotificationsPage/> </Layout>} />
      <Route path="/copy-trading" element={<Layout> <CopyTradingPage/> </Layout>} />
      <Route path="/trade/stocks" element={<Layout> <StockPage/> </Layout>} />
    </Routes>
  );
}
