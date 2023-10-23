import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title =
      'Widget Example'; // static: 이 부분은 따로 메모리를 두어 다른 객체가 공유

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: WidgetApp(),
    );
  }
}

class WidgetApp extends StatefulWidget {
  @override
  _WidgetExampleState createState() => _WidgetExampleState();
}

class _WidgetExampleState extends State<WidgetApp> {
  final List _buttonList = ['더하기', '빼기', '곱하기', '나누기'];
  final List<DropdownMenuItem<String>> _dropDownMenuItems =
      List.empty(growable: true);
  String? _buttonText;
  String sum = '';
  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    for (var item in _buttonList) {
      _dropDownMenuItems.add(DropdownMenuItem(
        value: item,
        child: Text(item),
      ));
    }
    _buttonText = _dropDownMenuItems[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('widget example'),
      ),
      body: Container(
          child: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                '결과 : $sum',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: value1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: value2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    var value1Int = double.parse(value1.value.text);
                    var value2Int = double.parse(value2.value.text);
                    double result;
                    if (_buttonText == '더하기') {
                      result = value1Int + value2Int;
                    } else if (_buttonText == '빼기') {
                      result = value1Int - value2Int;
                    } else if (_buttonText == '곱하기') {
                      result = value1Int * value2Int;
                    } else {
                      result = value1Int / value2Int;
                    }
                    sum = '$result';
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all((Colors.amber)),
                ),
                child: Row(
                  children: <Widget>[
                    const Icon(Icons.add),
                    Text(_buttonText!),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: DropdownButton(
                items: _dropDownMenuItems,
                onChanged: (String? value) {
                  setState(() {
                    _buttonText = value;
                  });
                },
                value: _buttonText,
              ),
            )
          ],
        ),
      )),
    );
  }
}
