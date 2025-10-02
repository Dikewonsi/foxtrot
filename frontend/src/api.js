// api.js
import axios from "axios";

// 1. Create an axios instance with the base URL of your Laravel API
const api = axios.create({
  baseURL: "http://localhost:8000/api", // 👈 Laravel backend URL
});

// 2. Attach token automatically to every request
api.interceptors.request.use((config) => {
  const token = localStorage.getItem("token"); // 👈 get token from storage
  if (token) {
    config.headers.Authorization = `Bearer ${token}`; // 👈 add token to request
  }
  return config;
});

// 3. Export it so we can use it everywhere
export default api;
