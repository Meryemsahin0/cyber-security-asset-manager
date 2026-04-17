# 🛡️ Security Assets - Mini Catalog App

This project is a professional **Mobile Asset Catalog** developed as part of the Flutter Weekly Training program. It focuses on displaying cybersecurity tools and managing a deployment queue (shopping cart) with a modern, dark-themed UI.

## 🚀 Project Overview
The application allows users to browse specialized security assets, view technical details, and manage their selection through a state-managed cart system.

### Key Features
* **Asset Listing:** Dynamic list of 6 specialized security products using `ListView.builder`.
* **Technical Details:** Deep-dive pages for each asset with optimized UI spacing.
* **Deployment Queue (Cart):** A fully functional cart system using the `Provider` pattern.
    * Add/Remove assets.
    * Increase/Decrease quantity with real-time total cost calculation.
    * Delete assets from the queue.
* **Cyber-Dark UI:** A custom design inspired by Kali Linux, featuring Teal Accent colors and circular modern icons.

## 🛠️ Tech Stack & Architecture
* **Framework:** Flutter (3.1.0+)
* **Language:** Dart
* **State Management:** `Provider` (Used for real-time cart updates)
* **Theme:** Custom Dark Theme (0xFF0D1117)

## 📁 Project Structure
```text
lib/
├── models/         # Data models (Product, Cart)
├── pages/          # UI Screens (Home, Detail, Cart)
└── main.dart       # App entry point & Provider setup# cyber-security-asset-manager
