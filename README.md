<div align="center">

# 🚀 W8 Practice: Lists, Pass Functions & Lift State Up

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)](LICENSE)

**Master Flutter fundamentals through hands-on practice with dynamic widgets, state management, and interactive UIs**

[📖 View Implementation Guide](IMPLEMENTATION.md) • [🎯 Exercises](#exercises) • [🚀 Getting Started](#getting-started)

</div>

---

## 🎯 Project Overview

A comprehensive Flutter practice project focusing on essential concepts:

- 🔄 **Dynamic Widget Generation** with loops
- 🎨 **State Management** and lifting state up
- 📱 **Screen Navigation** with conditional rendering
- 🔗 **Callback Functions** for parent-child communication
- 📊 **Data Binding** with models

---

## ✨ What's Implemented

<table>
<tr>
<td width="50%" valign="top">

### 🎨 Exercise 1: Loop Patterns
Explore **3 different methods** to generate widgets dynamically:
- Direct for loops
- Map() transformations  
- Dedicated functions

**Key Concepts:** List operations, spread operator, widget composition

</td>
<td width="50%" valign="top">

### 🔀 Exercise 2: Screen Navigation
Build a **temperature converter app** with:
- Welcome screen
- Converter screen
- Button-triggered navigation

**Key Concepts:** StatefulWidget, conditional rendering, callbacks

</td>
</tr>
<tr>
<td width="50%" valign="top">

### 👤 Exercise 3: Profile Binding
Create a **dynamic profile page** that:
- Binds data to UI components
- Renders scrollable tiles
- Uses real model data

**Key Concepts:** Data models, list mapping, scrollable content

</td>
<td width="50%" valign="top">

### 😄 Exercise 4: Favorite Jokes
Manage a **joke collection** with:
- 20+ jokes in scrollable list
- Single favorite selection
- Heart icon toggle

**Key Concepts:** ListView.builder, state lifting, single selection logic

</td>
</tr>
<tr>
<td colspan="2">

### 🌟 BONUS: Full Temperature Converter
A **complete temperature conversion app** featuring:
- ✅ Celsius to Fahrenheit conversion
- ✅ Real-time calculation as you type
- ✅ Beautiful gradient UI
- ✅ Back navigation support
- ✅ Input validation

**Key Concepts:** TextField handling, type conversion, bidirectional navigation

</td>
</tr>
</table>

---

## 🚀 Getting Started

### Prerequisites
```bash
Flutter SDK: >=3.0.0
Dart SDK: >=3.0.0
```

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/LK-Hour/W8-PRACTICE-Lists-Pass-Functions.git
cd W8-PRACTICE-Lists-Pass-Functions
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run an exercise**
```bash
# Exercise 1
flutter run -t lib/EXERCISE-1/ex_1_start.dart

# Exercise 2
flutter run -t lib/EXERCISE-2/main.dart

# Exercise 3
flutter run -t lib/EXERCISE-3/main.dart

# Exercise 4
flutter run -t lib/EXERCISE-4/main.dart

# Bonus
flutter run -t lib/BONUS/main.dart
```

---

## 📂 Project Structure

```
lib/
├── 📁 EXERCISE-1/          # Widget generation with loops
│   └── ex_1_start.dart
├── 📁 EXERCISE-2/          # Screen navigation
│   ├── main.dart
│   └── ui/screens/
│       ├── welcome_screen.dart
│       └── temperature_screen.dart
├── 📁 EXERCISE-3/          # Data binding with profile
│   ├── main.dart
│   ├── model/
│   ├── data/
│   └── ui/
├── 📁 EXERCISE-4/          # Favorite jokes manager
│   ├── main.dart
│   └── data/jokes.dart
└── 📁 BONUS/               # Complete temperature converter
    ├── main.dart
    └── ui/screens/
```

---

## 🎓 Learning Objectives

<details>
<summary><b>🔄 Generating Widgets with Loops</b></summary>

- Master 3 different approaches to create widgets dynamically
- Understand when to use each pattern
- Learn about the spread operator (`...`)
- Practice with `.map()` and `.toList()`
</details>

<details>
<summary><b>🎯 State Management & Lifting State Up</b></summary>

- Understand StatefulWidget vs StatelessWidget
- Learn when and where to place state
- Practice lifting state to parent components
- Manage shared state across multiple widgets
</details>

<details>
<summary><b>🔗 Passing Functions as Values</b></summary>

- Pass callbacks from parent to child
- Enable child-to-parent communication
- Handle button clicks and events
- Create reusable components with custom actions
</details>

<details>
<summary><b>📱 Conditional Rendering</b></summary>

- Switch between screens based on state
- Use ternary operators for widget selection
- Implement navigation without routes
- Build dynamic UIs
</details>

---

## 🎨 UI Highlights

### Exercise 2 & Bonus: Temperature Converter
- 🎨 Beautiful gradient background (Green → Blue)
- 🌡️ Thermometer icon design
- ⌨️ Number keyboard for input
- 🔄 Real-time conversion display
- ⬅️ Elegant back navigation

### Exercise 3: Profile Page
- 👤 Circular avatar display
- 📋 Scrollable information cards
- 🎯 Clean card-based layout
- 📱 Responsive design

### Exercise 4: Jokes Manager
- 😄 Scrollable joke list (20+ items)
- ❤️ Heart icon for favorites
- 🎯 Single favorite selection
- 📱 Clean list item design

---

## 🛠️ Technologies & Concepts

<table>
<tr>
<td>

**Flutter Widgets**
- StatefulWidget
- StatelessWidget
- ListView.builder
- TextField
- IconButton

</td>
<td>

**State Management**
- setState()
- State lifting
- Callback functions
- Parent-child communication

</td>
<td>

**Dart Features**
- Collections (List, Map)
- Spread operator
- Arrow functions
- Null safety

</td>
</tr>
</table>

---

## 📚 Documentation

- 📖 [Detailed Implementation Guide](IMPLEMENTATION.md)
- 💡 [Quick Answers](practice_answers.txt)
- 📋 [Project Instructions](project%20instruction.txt)

---

## 🤝 Contributing

This is a practice project for learning purposes. Feel free to:
- ⭐ Star this repo if you find it helpful
- 🐛 Report issues or bugs
- 💡 Suggest improvements
- 🔀 Fork and experiment

---

## 📜 License

This project is open source and available under the [MIT License](LICENSE).

---

## 👤 Author

**LK-Hour**

- GitHub: [@LK-Hour](https://github.com/LK-Hour)
- Project: [W8-PRACTICE-Lists-Pass-Functions](https://github.com/LK-Hour/W8-PRACTICE-Lists-Pass-Functions)

---

## 🙏 Acknowledgments

- 🎓 CADT Flutter Course
- 📚 Flutter Documentation
- 💙 Flutter Community

---

<div align="center">

**Built with ❤️ using Flutter**

⭐ Star this repo if it helped you learn!

[⬆ Back to Top](#-w8-practice-lists-pass-functions--lift-state-up)

</div>
