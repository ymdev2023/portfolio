import 'package:flutter/material.dart';
import 'package:gisa_app/config/color_palette.dart';
import 'package:gisa_app/screens/note.dart';
import 'exam_select.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: <Widget>[
        // Positioned(
        //   child: Container(
        //     height: MediaQuery.of(context).size.height * 0.9,
        //     decoration: BoxDecoration(
        //         color: const Color.fromARGB(255, 134, 134, 134),
        //         borderRadius: BorderRadius.circular(25)),
        //     padding: const EdgeInsets.only(top: 20, bottom: 20),
        //   ),
        // ),

        Positioned(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: Colors.white,
                // boxShadow: [
                //   BoxShadow(
                //     offset: const Offset(10, 0),
                //     color: Colors.black.withOpacity(0.4),
                //     blurRadius: 15,
                //     spreadRadius: 5,
                //   ),
                // ],
                // image: const DecorationImage(
                //     fit: BoxFit.cover,
                //     image: AssetImage('assets/images/bg.png')),

                // gradient:
                //     LinearGradient(begin: Alignment.bottomCenter, colors: [
                //   // Colors.deepPurpleAccent.shade100.withOpacity(0.4),
                //   // Colors.deepPurpleAccent.shade100.withOpacity(0.4),
                //   Palette.greenColor.withOpacity(0.5),
                //   Colors.blueGrey.shade100.withOpacity(0.7),
                //   // Palette.greenColor.withOpacity(0.3),
                //   // Colors.white,
                // ]),
                borderRadius: BorderRadius.circular(25)),
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  const Text(
                    '정보처리기사',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      // shadows: <Shadow>[
                      //   Shadow(
                      //     offset: const Offset(1, 1),
                      //     blurRadius: 2.0,
                      //     color: Colors.black.withOpacity(0.5),
                      //   ),
                      //   Shadow(
                      //     offset: const Offset(1, 1),
                      //     blurRadius: 2.0,
                      //     color: Colors.grey.withOpacity(0.4),
                      //   ),
                      // ],
                      color: Palette.signitureGreen,
                      fontSize: 52,
                      letterSpacing: -4,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  const Text(
                    '필기노트+기출',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        // shadows: <Shadow>[
                        //   Shadow(
                        //     offset: const Offset(1, 1),
                        //     blurRadius: 2.0,
                        //     color: Colors.black.withOpacity(0.5),
                        //   ),
                        //   Shadow(
                        //     offset: const Offset(1, 1),
                        //     blurRadius: 2.0,
                        //     color: Colors.grey.withOpacity(0.4),
                        //   ),
                        // ],
                        color: Palette.signitureGreen,
                        fontSize: 43,
                        letterSpacing: -1,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 65,
                  ),
                  const Text(
                    ' 최신 출제 경향 반영',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 28,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Positioned(
        //   top: 45,
        //   right: 0,
        //   left: 0,
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color: Colors.amber,
        //       boxShadow: [
        //         BoxShadow(
        //           offset: const Offset(0, 0),
        //           color: Colors.black.withOpacity(0.2),
        //           blurRadius: 15,
        //           spreadRadius: 5,
        //         ),
        //       ],
        //     ),
        //     height: 55,
        //   ),
        // ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.68,
          left: MediaQuery.of(context).size.width * 0.25,
          child: Column(
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    print('ok');
                    return const NoteScreen();
                  }));
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text(' 필기노트',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 24)),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(14),
                  // minimumSize: const Size(230, 50),
                  foregroundColor: Colors.white,
                  backgroundColor: Palette.signitureGreen,
                  shadowColor: Colors.black.withOpacity(0.7),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    print('ok');
                    return const ExamSelectScreen();
                  }));
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text(' 문제풀이',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 24)),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(14),

                  // minimumSize: const Size(230, 50),
                  foregroundColor: Colors.white,
                  backgroundColor: Palette.happyLime,
                  shadowColor: Colors.black.withOpacity(0.7),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
        Positioned(
          top: 65,
          right: 15,
          child: Container(
            width: 55,
            height: 50,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              // color: const Color.fromARGB(255, 122, 63, 109),
              // shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/edit.png',
                ),
                fit: BoxFit.fill,
              ),
              // border: Border.all(
              //     color: const Color.fromARGB(255, 122, 63, 109), width: 35),
            ),
          ),
        ),
      ]),
    );
  }
}
