import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../designs/colors.dart';

class TodoDetailScreen extends StatelessWidget {
  const TodoDetailScreen({super.key});

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
              top: 70,
              bottom: 10,
              left: 30,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '자세하게 하루를 기록해 볼까요?',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 29,
                    color: Colors.black,
                    letterSpacing: -3,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  '안 쓰고 싶은 부분은 건너뛰셔도 돼요.',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 26,
                    color: Colors.black.withOpacity(0.7),
                    letterSpacing: -3,
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
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
                        '  나중에 할래요  ',
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
              fit: BoxFit.fitWidth,
              width: width * 0.9,
              // height: height * 0.8,
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
            fit: BoxFit.fitHeight,
            'assets/images/sticky_note_3.svg',
            height: height * 0.55,
          ),
        ),
        Positioned(
          top: height * 0.05,
          left: width * 0.23,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "식단은",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
              ),
              const Text(
                "아침에 어떤거 점심에 블라블라",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const Text(
                "운동 기록",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
              ),
              const Text(
                "___________________",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const Text(
                "물 기록",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
              ),
              const Text(
                "___________________",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const Text(
                "몸무게 기록",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
              ),
              const Text(
                "___________________",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
              ),
            ],
          ),
        )
      ],
    );
  }
}
