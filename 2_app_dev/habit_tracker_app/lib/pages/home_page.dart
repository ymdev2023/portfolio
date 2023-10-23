import 'package:flutter/material.dart';

import '../components/habit_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // data structure for todays list

  // bool to control habit completed
  bool habitCompleted = false;

  // checkbox was tapped
  void checkBoxTapped(bool? value) {
    setState(() {
      habitCompleted = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: ListView(
        children: [
          // habit tiles
          HabitTile(
            habitName: 'morning',
            habitCompleted: habitCompleted,
            onChanged: (value) => checkBoxTapped(value),
          ),
        ],
      ),
    );
  }
}
