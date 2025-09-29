// tailwind.config.js
import { defineConfig } from 'vite'
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
  plugins: [tailwindcss()],
  css: {
    darkMode: 'class', // This makes your .dark toggle work
  }
})
