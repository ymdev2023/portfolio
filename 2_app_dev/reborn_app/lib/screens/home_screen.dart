import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reborn_app/designs/colors.dart';
import 'package:reborn_app/screens/data_screen.dart';
import 'package:reborn_app/supplemental/cut_corners_border.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQueryData deviceData = MediaQuery.of(context);
    // Size screenSize = deviceData.size;

    return Scaffold(
        // TODO: 네비게이션 바
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                size: 40,
                color: rebornTheme0Blue300,
              ),
              label: '처음으로',
              backgroundColor: rebornTheme0Orange400,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.flag,
                size: 40,
                color: rebornTheme0Blue300,
              ),
              label: '목표관리',
              backgroundColor: rebornTheme0Orange400,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_month,
                size: 40,
                color: rebornTheme0Blue300,
              ),
              label: '달력보기',
              backgroundColor: rebornTheme0Orange400,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding:
              const EdgeInsets.only(top: 90, bottom: 10, left: 30, right: 20),
          child: SingleChildScrollView(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    '오늘부터,',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 45,
                        color: rebornTheme0Grey200,
                        letterSpacing: 6),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Re:born',
                    style: TextStyle(
                        fontFamily: 'ROKAFSans',
                        fontWeight: FontWeight.w900,
                        fontSize: 70,
                        color: rebornTheme0Blue400,
                        letterSpacing: 3
                        // foreground: Paint()
                        //   ..style = PaintingStyle.stroke
                        //   ..strokeWidth = 4
                        //   ..color = customColorBlue2,
                        ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    '닉네임, 몸무게, 키를 적어주세요.',
                    style: TextStyle(
                      // fontFamily: 'CookieRunFont_TTF',
                      fontWeight: FontWeight.w400,
                      fontSize: 26,
                      color: rebornTheme0Grey500,
                      letterSpacing: -2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: InputController(),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

// TODO: TextEdittingController
class InputController extends StatefulWidget {
  const InputController({super.key});

  @override
  State<InputController> createState() => _InputControllerState();
}

class _InputControllerState extends State<InputController> {
  final _inputControllerNickname = TextEditingController();
  final _inputControllerWeight = TextEditingController();
  final _inputControllerHeight = TextEditingController();
  @override
  void dispose() {
    _inputControllerNickname.dispose();
    _inputControllerWeight.dispose();
    _inputControllerHeight.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
          ),
          TextFormField(
            controller: _inputControllerNickname,
            decoration: const InputDecoration(
              labelText: '닉네임(8자 이내)',
              counterText: '',
              border: CutCornersBorder(),
              focusedBorder: CutCornersBorder(
                borderSide: BorderSide(
                  width: 2.0,
                  color: rebornTheme0Blue400,
                ),
              ),
              floatingLabelStyle: TextStyle(
                color: rebornTheme0Blue400,
              ),
// ),
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.all(Radius.circular(20)),
              //   borderSide: BorderSide(
              //     color: Colors.blue,
              // ),
              // ),
            ),
            validator: (value) {
              // 입력값이 없으면 메시지 출력
              if (value!.isEmpty) {
                return '닉네임을 적어주세요.';
              } else {
                return null;
              }
            },
            maxLength: 8,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _inputControllerWeight,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'[/\\]')),
            ],
            decoration: const InputDecoration(
              labelText: '몸무게',
              suffixText: 'kg',
              counterText: '',
              border: CutCornersBorder(),
              focusedBorder: CutCornersBorder(
                borderSide: BorderSide(
                  width: 2.0,
                  color: rebornTheme0Blue400,
                ),
              ),
              floatingLabelStyle: TextStyle(
                color: rebornTheme0Blue400,
              ),
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.all(Radius.circular(20)),
              //   borderSide: BorderSide(
              //     color: Colors.blue,
              //   ),
              // ),
            ),
            validator: (value) {
              // 입력값이 없으면 메시지 출력
              if (value!.isEmpty) {
                return '몸무게를 적어주세요.';
              } else {
                return null;
              }
            },
            maxLength: 3,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _inputControllerHeight,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'[/\\]')),
            ],
            decoration: const InputDecoration(
              labelText: '키',
              suffixText: 'cm',
              counterText: '',
              border: CutCornersBorder(),
              focusedBorder: CutCornersBorder(
                borderSide: BorderSide(
                  width: 2.0,
                  color: rebornTheme0Blue400,
                ),
              ),
              floatingLabelStyle: TextStyle(
                color: rebornTheme0Blue400,
              ),
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.all(Radius.circular(20)),
              //   borderSide: BorderSide(
              //     color: Colors.blue,
              //   ),
              // ),
            ),
            validator: (value) {
              // 입력값이 없으면 메시지 출력
              if (value!.isEmpty) {
                return '키를 적어주세요.';
              } else {
                return null;
              }
            },
            maxLength: 3,
          ),
          const SizedBox(
            height: 60,
          ),
          ElevatedButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                // TODO: (보류)스낵바랑 페이지 이동을 연결
                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //   content: const Text('저장 완료!'),
                //   backgroundColor: rebornTheme1Blue400,
                //   duration: const Duration(seconds: 5),
                //   action: SnackBarAction(
                //       label: 'home2pw',
                //       onPressed: () {
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => PWScreen()));
                //       }),
                // ));

                final inputNickname = _inputControllerNickname.text;
                final inputWeight = _inputControllerWeight.text;
                final inputHeight = _inputControllerHeight.text;

                // print('$inputNickname, $inputHeight, $inputWeight');

                final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DataScreen()));
              } else {
                print('Error!');
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: rebornTheme0Orange400,
              minimumSize: const Size(100, 50),
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  '정했어요',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
