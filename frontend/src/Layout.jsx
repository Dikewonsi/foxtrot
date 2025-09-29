import { useState, useEffect } from "react";
import { useLocation } from "react-router-dom";
import Navbar from "./components/Navbar";
import Spinner from "./components/Spinner";
import BottomNavbar from "./components/BottomNavbar";

export default function Layout({ children }) {
  const [loading, setLoading] = useState(true);
  const location = useLocation();

  const hideNavRoutes = ["/login", "/register"];
  const shouldHideNav = hideNavRoutes.includes(location.pathname);

  useEffect(() => {
    const timer = setTimeout(() => setLoading(false), 500);
    return () => clearTimeout(timer);
  }, []);

  return (
    <div className="flex flex-col min-h-screen font-sans">
      {!shouldHideNav && <Navbar />}

      <main className="flex-grow pb-12">
        {loading ? (
          <div className="flex items-center justify-center h-full">
            <Spinner />
          </div>
        ) : (
          children
        )}
      </main>

      {!shouldHideNav && <BottomNavbar />}
    </div>
  );
}
