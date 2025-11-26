import 'package:flutter/material.dart';

import 'ui/screens/welcome_screen.dart';
import 'ui/screens/temperature_screen.dart';

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  // State variable to track which screen to show
  bool showWelcomeScreen = true;

  // Function to switch to temperature screen
  void switchToConverter() {
    setState(() {
      showWelcomeScreen = false;
    });
  }

  // Function to go back to welcome screen
  void switchToWelcome() {
    setState(() {
      showWelcomeScreen = true;
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff16C062), Color(0xff00BCDC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // Conditional rendering: show WelcomeScreen or TemperatureScreen
          child: showWelcomeScreen
              ? WelcomeScreen(onStartPressed: switchToConverter)
              : TemperatureScreen(onBackPressed: switchToWelcome),
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
