# 🍔 Food Delivery App (flutter)

A minimal Flutter app for browsing food items, restaurants, and meal details — built using Cubit for state management and Dio for networking.

---

## 🚀 Features

- 🏪 Browse restaurants and their available meals
- 🍕 View food items with name, image, and price
- 📄 Meal Detail Screen showing full description and price
- 📦 Add/remove meals to a simple local cart *(optional)*
- 🧠 State management using Cubit
- 🌐 API requests using Dio

---

## 🧱 Tech Stack

- Flutter (3.x)
- Dart
- Cubit (from flutter_bloc)
- Dio for API requests
- Equatable (for clean state management)
- Freezed (optional, for models)

---

## 📱 Screens Overview

### 🏠 Home Screen
- List of available restaurants  
- Tap any restaurant to view its menu


### 📄 Meal Detail Screen
- Tapping a meal opens a detail view  
- Shows:
  - 🖼 Full image
  - 💬 Description
  - 💰 Price

### 🛒 Cart Page *(optional)*
- List of selected meals with total cost  
- Remove/edit items

---

## 🧾 Example Meal Detail UI

| Feature        | Display                                |
|----------------|-----------------------------------------|
| Name           | "Grilled Chicken Sandwich"              |
| Price          | "$9.99"                                 |
| Description    | "Juicy grilled chicken with herbs..."   |
| Image          | Full width banner-style image           |

---

## 📂 Folder Structure (Cubit Based)
