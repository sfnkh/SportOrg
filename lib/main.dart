import 'package:flutter/material.dart';

// Import your screen files
import 'screens/home_screen.dart';
import 'screens/add_session_screen.dart';
import 'screens/roster_screen.dart';

void main() {
  runApp(SportballCoachApp());
}

class SportballCoachApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sportball Coach Organizer',
      theme: ThemeData(
        primaryColor: Color(0xFFD62828), // Primary Red
        scaffoldBackgroundColor: Color(0xFFF1FAEE), // Light background
      ),
      home: HomeScreen(),
      routes: {
        '/add-session': (context) => AddSessionScreen(),
        '/roster': (context) => RosterScreen(),
      },
    );
  }
}
