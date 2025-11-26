# 📚 Week 8 Practice - Implementation Guide

## 🎯 Project Overview

This document provides a comprehensive breakdown of all exercises implemented in the Week 8 Flutter practice, focusing on **Lists**, **Passing Functions**, and **Lifting State Up**.

---

## 📋 Table of Contents

1. [Exercise 1 - Widget Generation with Loops](#exercise-1)
2. [Exercise 2 - Screen Navigation with State](#exercise-2)
3. [Exercise 3 - Data Binding with Models](#exercise-3)
4. [Exercise 4 - Favorite Jokes Manager](#exercise-4)
5. [Bonus - Temperature Converter](#bonus)

---

## <a name="exercise-1"></a>🔄 Exercise 1: Widget Generation with Loops

### **Objective**
Explore 3 different ways to create widgets dynamically using loops in Flutter.

### **Implementation**

#### Method 1: Direct For Loop
```dart
Column(
  children: [
    Text("Start"),
    for (int i = 0; i < colors.length; i++) Text(colors[i]),
    Text("End"),
  ],
)
```

#### Method 2: Map() Method
```dart
Column(
  children: [
    Text("Start"),
    ...colors.map((color) => Text(color)).toList(),
    Text("End"),
  ],
)
```

#### Method 3: Dedicated Function
```dart
List<Widget> getColor() {
  return colors.map((color) => Text(color)).toList();
}

Column(
  children: [
    Text("Start"),
    ...getColor(),
    Text("End"),
  ],
)
```

### **Key Concepts**
- ✅ For loop syntax inside widget arrays
- ✅ Spread operator (`...`)
- ✅ `.map()` for transforming lists
- ✅ Separating widget logic into functions

### **Files Modified**
- `lib/EXERCISE-1/ex_1_start.dart`

---

## <a name="exercise-2"></a>🔀 Exercise 2: Screen Navigation with State

### **Objective**
Implement conditional rendering to switch between Welcome Screen and Temperature Screen using state management.

### **Implementation**

#### Architecture
```
TemperatureApp (StatefulWidget)
├── State: showWelcomeScreen (bool)
├── Function: switchToConverter()
│
├── if showWelcomeScreen == true
│   └── WelcomeScreen (receives onStartPressed callback)
│
└── else
    └── TemperatureScreen
```

#### Parent Component (main.dart)
```dart
class _TemperatureAppState extends State<TemperatureApp> {
  bool showWelcomeScreen = true;

  void switchToConverter() {
    setState(() {
      showWelcomeScreen = false;
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: showWelcomeScreen
            ? WelcomeScreen(onStartPressed: switchToConverter)
            : TemperatureScreen(),
      ),
    );
  }
}
```

#### Child Component (welcome_screen.dart)
```dart
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, required this.onStartPressed});

  final Function() onStartPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onStartPressed,
      child: Text('Start to convert'),
    );
  }
}
```

### **Key Concepts**
- ✅ **Lifting State Up** - Parent controls which screen displays
- ✅ **Callback Functions** - Child triggers parent's state change
- ✅ **Conditional Rendering** - Using ternary operator for screen switching
- ✅ **StatefulWidget vs StatelessWidget**

### **Files**
- `lib/EXERCISE-2/main.dart`
- `lib/EXERCISE-2/ui/screens/welcome_screen.dart`
- `lib/EXERCISE-2/ui/screens/temperature_screen.dart`

---

## <a name="exercise-3"></a>🎨 Exercise 3: Data Binding with Models

### **Objective**
Replace hardcoded values with dynamic data from a ProfileData model.

### **Implementation**

#### Data Model
```dart
class ProfileData {
  final String name;
  final String position;
  final String avatarUrl;
  final List<TileData> tiles;
}

class TileData {
  final IconData icon;
  final String title;
  final String value;
}
```

#### ProfileApp Widget
```dart
class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key, required this.profileData});

  final ProfileData profileData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(profileData.avatarUrl),
          ),
          Text(profileData.name),
          Text(profileData.position),
          // Loop through tiles
          ...profileData.tiles.map(
            (tile) => ProfileTile(
              icon: tile.icon,
              title: tile.title,
              data: tile.value,
            ),
          ),
        ],
      ),
    );
  }
}
```

### **Key Concepts**
- ✅ **Data Binding** - Connecting UI with model data
- ✅ **List Mapping** - Converting data list to widget list
- ✅ **Scrollable Content** - Using `SingleChildScrollView`
- ✅ **Reusable Components** - ProfileTile widget

### **Files**
- `lib/EXERCISE-3/main.dart`
- `lib/EXERCISE-3/model/profile_tile_model.dart`
- `lib/EXERCISE-3/data/profile_data.dart`
- `lib/EXERCISE-3/ui/screens/profile.dart`

---

## <a name="exercise-4"></a>😄 Exercise 4: Favorite Jokes Manager

### **Objective**
Create a scrollable list of jokes where only ONE can be marked as favorite.

### **Implementation**

#### Data Structure
```dart
class Joke {
  final String title;
  final String description;
}

List<Joke> jokes = [
  Joke(title: "Why don't scientists trust atoms?", 
       description: "Because they make up everything!"),
  // ... 20+ more jokes
];
```

#### Architecture
```
JokesApp (StatefulWidget) - Parent
├── State: favoriteJokeIndex (int?)
├── Function: setFavorite(int index)
│
└── ListView.builder
    └── FavoriteCard (StatelessWidget) - Child
        ├── Receives: joke, isFavorite, onFavoriteClick
        └── IconButton → calls onFavoriteClick
```

#### Parent Logic
```dart
class _JokesAppState extends State<JokesApp> {
  int? favoriteJokeIndex;

  void setFavorite(int index) {
    setState(() {
      favoriteJokeIndex = (favoriteJokeIndex == index) ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jokes.length,
      itemBuilder: (context, index) {
        return FavoriteCard(
          joke: jokes[index],
          isFavorite: favoriteJokeIndex == index,
          onFavoriteClick: () => setFavorite(index),
        );
      },
    );
  }
}
```

#### Child Component
```dart
class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    required this.joke,
    required this.isFavorite,
    required this.onFavoriteClick,
  });

  final Joke joke;
  final bool isFavorite;
  final Function() onFavoriteClick;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onFavoriteClick,
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : Colors.grey,
      ),
    );
  }
}
```

### **Key Concepts**
- ✅ **Lifting State Up** - Parent owns favorite state
- ✅ **Callback Pattern** - Child → Parent communication
- ✅ **ListView.builder** - Efficient list rendering
- ✅ **Single Selection Logic** - Only one favorite at a time
- ✅ **Nullable Types** - `int?` for optional favorite

### **Files**
- `lib/EXERCISE-4/main.dart`
- `lib/EXERCISE-4/data/jokes.dart`

---

## <a name="bonus"></a>🌡️ Bonus: Working Temperature Converter

### **Objective**
Implement a fully functional temperature converter with navigation between Welcome and Converter screens.

### **Implementation**

#### Temperature Conversion Logic
```dart
class _TemperatureScreenState extends State<TemperatureScreen> {
  String temperatureInput = '';

  @override
  Widget build(BuildContext context) {
    double? celsius = double.tryParse(temperatureInput);
    double fahrenheit = celsius != null ? (celsius * 9 / 5) + 32 : 0;

    return Column(
      children: [
        TextField(
          onChanged: (value) {
            setState(() {
              temperatureInput = value;
            });
          },
        ),
        Container(
          child: Text(
            celsius != null ? fahrenheit.toStringAsFixed(2) : '',
          ),
        ),
      ],
    );
  }
}
```

#### Navigation with Back Button
```dart
// Parent
void switchToWelcome() {
  setState(() => showWelcomeScreen = true);
}

void switchToConverter() {
  setState(() => showWelcomeScreen = false);
}

// Temperature Screen with back button
IconButton(
  onPressed: widget.onBackPressed,
  icon: Icon(Icons.arrow_back),
)
```

### **Key Concepts**
- ✅ **Real-time Input Handling** - `onChanged` callback
- ✅ **Type Conversion** - `double.tryParse()` for safe parsing
- ✅ **Bidirectional Navigation** - Forward and back buttons
- ✅ **State Management** - TextField value tracking
- ✅ **Number Formatting** - `.toStringAsFixed(2)`

### **Features**
- 🔄 Switch between Welcome and Converter screens
- 🌡️ Real-time Celsius to Fahrenheit conversion
- ⬅️ Back button to return to Welcome screen
- ⌨️ Number keyboard input
- ✨ Gradient background design

### **Files**
- `lib/BONUS/main.dart`
- `lib/BONUS/ui/screens/welcome_screen.dart`
- `lib/BONUS/ui/screens/temperature_screen.dart`

---

## 🎓 Key Learning Outcomes

### **1. Widget Generation Patterns**
- Direct loops vs map() vs dedicated functions
- When to use each approach
- Performance considerations

### **2. State Management**
- Lifting state up to parent components
- StatefulWidget vs StatelessWidget
- When and where to store state

### **3. Callback Functions**
- Passing functions as parameters
- Parent-child communication
- Event handling patterns

### **4. Data Binding**
- Connecting UI to data models
- Dynamic widget generation from data
- List transformations

### **5. List Rendering**
- ListView.builder for large lists
- SingleChildScrollView for mixed content
- Efficient widget rendering

---

## 📦 Project Structure

```
lib/
├── EXERCISE-1/
│   └── ex_1_start.dart
├── EXERCISE-2/
│   ├── main.dart
│   └── ui/screens/
│       ├── welcome_screen.dart
│       └── temperature_screen.dart
├── EXERCISE-3/
│   ├── main.dart
│   ├── model/profile_tile_model.dart
│   ├── data/profile_data.dart
│   └── ui/
│       ├── screens/profile.dart
│       └── theme/theme.dart
├── EXERCISE-4/
│   ├── main.dart
│   └── data/jokes.dart
└── BONUS/
    ├── main.dart
    └── ui/screens/
        ├── welcome_screen.dart
        └── temperature_screen.dart
```

---

## 🚀 How to Run

### Run Specific Exercise:
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

## 📝 Summary

This practice project demonstrates fundamental Flutter concepts:

| Exercise | Main Concept | Widget Type | Key Feature |
|----------|-------------|-------------|-------------|
| 1 | Loop Patterns | StatelessWidget | Widget generation |
| 2 | State & Navigation | StatefulWidget | Screen switching |
| 3 | Data Binding | StatelessWidget | Model integration |
| 4 | State Management | StatefulWidget + StatelessWidget | Favorite selection |
| Bonus | Interactive UI | StatefulWidget | Real-time conversion |

---

**Author:** LK-Hour  
**Repository:** [W8-PRACTICE-Lists-Pass-Functions](https://github.com/LK-Hour/W8-PRACTICE-Lists-Pass-Functions)  
**Date:** November 27, 2025
