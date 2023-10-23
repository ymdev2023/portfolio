import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../designs/colors.dart';

class TodoSimpleScreen extends StatelessWidget {
  const TodoSimpleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 90,
              bottom: 10,
              left: 30,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '환영합니다, 김돼지님!',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 37,
                    color: Colors.black,
                    letterSpacing: -2,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  '간단하게 하루를 기록해볼까요?',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 28,
                    color: Colors.black.withOpacity(0.7),
                    letterSpacing: -2,
                  ),
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                // SvgPicture.asset(
                //   'assets/images/sticky_note_1.svg',
                //   height: height * 0.5,
                // ),
                StackedImageText(height: height, width: width),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: rebornTheme0Blue300,
                        minimumSize: const Size(100, 50),
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text(
                        '   다했어요!   ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -1,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: rebornTheme0Grey200,
                        minimumSize: const Size(100, 50),
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text(
                        '  자세히 쓸래요  ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -1,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            child: SvgPicture.asset(
              'assets/images/tv.svg',
              // fit: BoxFit.fitWidth,
              width: width,
            ),
          ),
        ],
      ),
    );
  }
}

class StackedImageText extends StatelessWidget {
  const StackedImageText({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.topCenter,
          child: SvgPicture.asset(
            'assets/images/sticky_note_1.svg',
            height: height * 0.5,
          ),
        ),
        Positioned(
          top: height * 0.15,
          left: width * 0.13,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "ㅁ 식단",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const Text(
                "ㅁ 운동",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const Text(
                "ㅁ 물",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const Text(
                "ㅁ 몸무게",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
              ),
            ],
          ),
        )
      ],
    );
  }
}
