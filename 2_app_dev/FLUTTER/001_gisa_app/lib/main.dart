import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '정보처리기사',
      theme: ThemeData(
        fontFamily: 'NanumSquareNeoTTF',
      ),
      home: const HomeScreen(),
      // home: const ExamViewScreen(),
    );
  }
}
