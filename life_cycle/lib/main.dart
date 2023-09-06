import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
} // widget itself : only has state

class _AppState extends State<App> {
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

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
      theme: ThemeData(
          textTheme: TextTheme(
              titleLarge: TextStyle(
                  color: Colors.red.shade500, fontWeight: FontWeight.w400))),
      home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 247, 219, 207),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                showTitle ? const MyLargeTitle() : const Text('nothing'),
                IconButton(
                    onPressed: toggleTitle,
                    icon: const Icon(Icons.remove_red_eye))
              ],
            ),
          )),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    Key? key,
  }) : super(key: key);

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  void initState() {
// initstate : 1번만 호출됨, 부모 요소에 의존하는 데이터 초기화, api에서 데이터 업데이트
    super.initState();
    print('initState!');
  }

  @override
  void dispose() {
    print('dispose!'); // dispose: 위젯이 위젯트리에서 제거되기전 무언가를 취소(unsubscribe)
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build!');
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}

// build context는 최근접 위젯 트리의 정보를 제공
