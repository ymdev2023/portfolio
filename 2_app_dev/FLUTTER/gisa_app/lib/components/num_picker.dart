import 'package:flutter/material.dart';
import 'package:gisa_app/screens/exam_view.dart';
import 'package:numberpicker/numberpicker.dart';

class NumPicker extends StatefulWidget {
  const NumPicker({super.key});

  @override
  State<NumPicker> createState() => _NumPickerState();
}

class _NumPickerState extends State<NumPicker> {
  int _currentYear = 2021;
  List<String> rounds_2020 = ["1-2회", "3회", "4회"];
  List<String> rounds_2021 = ["1회", "2회", "3회"];
  List<String> rounds_2022 = ["1회", "2회"];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NumberPicker(
          haptics: true,
          textStyle: const TextStyle(
            letterSpacing: -2,
            fontSize: 30,
            color: Colors.black,
          ),
          value: _currentYear,
          axis: Axis.horizontal,
          minValue: 2020,
          maxValue: 2022,
          selectedTextStyle: const TextStyle(
            letterSpacing: -2,
            fontSize: 30,
            color: Colors.green,
          ),
          onChanged: (value) => setState(() {
            _currentYear = value;
            print(_currentYear);
          }),
        ),
        // Text('Current value: $_currentYear'),
        if (_currentYear == 2020)
          Container(
            padding: const EdgeInsets.only(top: 45),
            child: Column(
              children: [
                const Text(
                  '회차를 선택하세요.',
                  style: TextStyle(
                    fontSize: 25,
                    letterSpacing: -2,
                  ),
                ),
                PickRound(
                  pickedColor: Colors.deepPurpleAccent,
                  pickedRounds: rounds_2020,
                ),
              ],
            ),
          ),
        if (_currentYear == 2021)
          Container(
            padding: const EdgeInsets.only(top: 45),
            child: Column(
              children: [
                const Text(
                  '회차를 선택하세요.',
                  style: TextStyle(
                    fontSize: 25,
                    letterSpacing: -2,
                  ),
                ),
                PickRound(
                  pickedColor: Colors.lightGreen,
                  pickedRounds: rounds_2021,
                ),
              ],
            ),
          ),
        if (_currentYear == 2022)
          Container(
            padding: const EdgeInsets.only(top: 45),
            child: Column(
              children: [
                const Text(
                  '회차를 선택하세요.',
                  style: TextStyle(
                    fontSize: 25,
                    letterSpacing: -2,
                  ),
                ),
                PickRound(
                  pickedColor: Colors.deepOrangeAccent,
                  pickedRounds: rounds_2022,
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class PickRound extends StatelessWidget {
  const PickRound({
    super.key,
    required this.pickedRounds,
    required this.pickedColor,
  });

  final List<String> pickedRounds;
  final Color pickedColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 35, left: 20),
        height: 150,
        child: ListView.builder(
          shrinkWrap: false,
          scrollDirection: Axis.horizontal,
          itemCount: pickedRounds == null ? 0 : pickedRounds.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ExamViewScreen();
                }));
                print(pickedRounds[index]);
              },
              child: Container(
                margin: const EdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: pickedColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: const Offset(3, 3))
                    ]),
                width: 95,
                child: Text(
                  textAlign: TextAlign.center,
                  pickedRounds[index],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            );
          },
        ));
  }
}

Widget box(String title, Color backgroundcolor) {
  return Container(
      margin: const EdgeInsets.all(10),
      width: 80,
      color: backgroundcolor,
      alignment: Alignment.center,
      child: Text(title,
          style: const TextStyle(color: Colors.white, fontSize: 20)));
}
