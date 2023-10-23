// WEBTOON APP

import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';
// import 'package:toonflix/services/api_service.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key}); // 위젯 식별용

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
