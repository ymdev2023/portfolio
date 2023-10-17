import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
} // widget itself : only has state

class _AppState extends State<App> {
  // int counter = 0;
  List<int> numbers = [];
  void onClicked() {
    setState(() {
      numbers.add(numbers.length);
      // counter = counter + 1; // setstate: reflect changes!
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 247, 219, 207),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Click Count',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                for (var n in numbers) Text('$n'),
                IconButton(
                    iconSize: 40,
                    onPressed: onClicked,
                    icon: const Icon(
                      Icons.add_box_rounded,
                    ))
              ],
            ),
          )),
    );
  }
}
