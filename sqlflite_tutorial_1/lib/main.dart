import 'package:flutter/material.dart';
import 'package:sqlflite_tutorial_1/repository/sql_db.dart';
import 'package:sqlflite_tutorial_1/screens/db_screen.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); // Native code에서 플랫폼간 채널 통해 비동기적 이벤트 사용시 필요
  SqlDB();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: DBScreen(),
    );
  }
}
