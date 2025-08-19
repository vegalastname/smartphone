import 'package:flutter/material.dart';
import 'package:health_tracker_mobile/steps_notifier.dart';
import 'steps_screen.dart';
import 'heart_rate_screen.dart';
final stepsNotifier = StepsNotifier();

void main() {
  runApp(const HealthTrackerApp());
}

class HealthTrackerApp extends StatelessWidget {
  const HealthTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HealthTracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      debugShowCheckedModeBanner: false,  // Agrega esta línea
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HealthTracker')),
      body: PageView(
        children: const [
          StepsScreen(),
          HeartRateScreen(),
        ],
      ),
    );
  }
}