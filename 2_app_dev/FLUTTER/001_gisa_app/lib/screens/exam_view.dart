import 'package:flutter/material.dart';
import 'package:gisa_app/config/color_palette.dart';
import 'package:gisa_app/src/exam_data.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../components/progress_bar.dart';
import 'home.dart';

class ExamViewScreen extends StatefulWidget {
  const ExamViewScreen({super.key});

  @override
  State<ExamViewScreen> createState() => _ExamViewScreenState();
}

class _ExamViewScreenState extends State<ExamViewScreen> {
  final examData = examData2020_1;
  var clickedAns = 0;
  var wrongChecked = 0;
  var answerRateReduced = 0;
  bool isClicked = false;
  int qIndex = 0;
  // late final String qNum = examData[qIndex]['q_num'];
  // late final int aNum = examData[qIndex]['a_num'];
  // late final String question = examData[qIndex]['question'];
  // late final String option1 = examData[qIndex]['options'][0];
  // late final String option2 = examData[qIndex]['options'][1];
  // late final String option3 = examData[qIndex]['options'][2];
  // late final String option4 = examData[qIndex]['options'][3];

  // List<String> docIDs = [];

  // void readData() {
  //   final ref = FirebaseFirestore.instance.collection("exams");
  //   // .collection('sub1');
  //   ref.get().then((value) => print(value.data));
  //  FirebaseFirestore.instance
  //     .collection('exams')
  //     .get()
  //     .then((QuerySnapshot querysnapshot) {
  //   for (var doc in querysnapshot.docs) {
  //     FirebaseFirestore.instance
  //         .doc()
  //         .collection("sub1")
  //         .get()
  //         .then((value) => print(value));
  //   }
  // });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   readData();
  // }
  @override
  void initState() {
    super.initState();
  }

  void _nextQuestion() {
    setState(() {
      qIndex++;
      clickedAns = 0;
      print(qIndex);
    });
  }

  void _prevQuestion() {
    setState(() {
      qIndex--;
      clickedAns = 0;
      print(qIndex);
    });
  }

  void _wrongChecked() {
    setState(() {
      if (wrongChecked < 2) {
        wrongChecked++;
        print(wrongChecked);
      }
      print(wrongChecked);
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('2020년 정보처리기사 1-2회'),
          backgroundColor: Palette.signitureGreen,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const HomeScreen();
              }));
            },
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.only(
              top: 30.0,
              left: 15,
              right: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProgressBar(
                  index: (qIndex + 1).toString(),
                ),
                const Spacer(
                  flex: 2,
                ),
                Text.rich(
                  TextSpan(
                      text: examData[qIndex]['q_num'],
                      style: const TextStyle(
                        fontSize: 25,
                        color: Palette.signitureGreen,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -1,
                      ),
                      children: [
                        const TextSpan(
                            text: '_ ',
                            style: TextStyle(
                              // color: Colors.black,
                              fontSize: 25,
                              letterSpacing: -1,
                            )),
                        TextSpan(
                            text: examData[qIndex]['question'],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              letterSpacing: -1,
                            )),
                      ]),
                ),
                const Spacer(
                  flex: 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isClicked = !isClicked;
                          clickedAns = 1;
                        });
                      },
                      child: Text.rich(
                        TextSpan(
                            text: (isClicked == true) && (clickedAns == 1)
                                ? '❶ '
                                : '① ',
                            style: TextStyle(
                              fontSize: 25,
                              color: (isClicked == true) && (clickedAns == 1)
                                  ? Palette.happyLime
                                  : Palette.signitureGreen,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -1,
                            ),
                            children: [
                              TextSpan(
                                  text: examData[qIndex]['options'][0],
                                  style: TextStyle(
                                    color:
                                        (isClicked == true) && (clickedAns == 1)
                                            ? Palette.happyLime
                                            : Colors.black,
                                    fontSize: 20,
                                    fontWeight:
                                        (isClicked == true) && (clickedAns == 1)
                                            ? FontWeight.w700
                                            : FontWeight.w300,
                                    shadows: [
                                      Shadow(
                                          color: (isClicked == true) &&
                                                  (clickedAns == 1)
                                              ? Colors.black.withOpacity(0.3)
                                              : Colors.transparent,
                                          offset: const Offset(1, 1))
                                    ],
                                    letterSpacing: -1,
                                  )),
                            ]),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isClicked = !isClicked;
                          clickedAns = 2;
                        });
                      },
                      child: Text.rich(
                        TextSpan(
                            // recognizer: TapGestureRecognizer()
                            //   ..onTap = () {
                            //     setState(() {
                            //       isClicked = !isClicked;
                            //       clickedAns = 2;
                            //       // print(clickedAns);
                            //       // print(isClicked);
                            //     });
                            //   },
                            text: (isClicked == true) && (clickedAns == 2)
                                ? '❷ '
                                : '② ',
                            style: TextStyle(
                              fontSize: 25,
                              color: (isClicked == true) && (clickedAns == 2)
                                  ? Palette.happyLime
                                  : Palette.signitureGreen,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -1,
                            ),
                            children: [
                              TextSpan(
                                  text: examData[qIndex]['options'][1],
                                  style: TextStyle(
                                    color:
                                        (isClicked == true) && (clickedAns == 2)
                                            ? Palette.happyLime
                                            : Colors.black,
                                    fontSize: 20,
                                    fontWeight:
                                        (isClicked == true) && (clickedAns == 2)
                                            ? FontWeight.w700
                                            : FontWeight.w300,
                                    shadows: [
                                      Shadow(
                                          color: (isClicked == true) &&
                                                  (clickedAns == 2)
                                              ? Colors.black.withOpacity(0.3)
                                              : Colors.transparent,
                                          offset: const Offset(1, 1))
                                    ],
                                    letterSpacing: -1,
                                  )),
                            ]),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isClicked = !isClicked;
                          clickedAns = 3;
                          print(isClicked);
                        });
                      },
                      child: Text.rich(
                        TextSpan(
                            text: (isClicked == true) && (clickedAns == 3)
                                ? '❸ '
                                : '③ ',
                            style: TextStyle(
                              fontSize: 25,
                              color: (isClicked == true) && (clickedAns == 3)
                                  ? Palette.happyLime
                                  : Palette.signitureGreen,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -1,
                            ),
                            children: [
                              TextSpan(
                                  text: examData[qIndex]['options'][2],
                                  style: TextStyle(
                                    color:
                                        (isClicked == true) && (clickedAns == 3)
                                            ? Palette.happyLime
                                            : Colors.black,
                                    fontSize: 20,
                                    fontWeight:
                                        (isClicked == true) && (clickedAns == 3)
                                            ? FontWeight.w700
                                            : FontWeight.w300,
                                    shadows: [
                                      Shadow(
                                          color: (isClicked == true) &&
                                                  (clickedAns == 3)
                                              ? Colors.black.withOpacity(0.3)
                                              : Colors.transparent,
                                          offset: const Offset(1, 1))
                                    ],
                                    letterSpacing: -1,
                                  )),
                            ]),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isClicked = !isClicked;
                          clickedAns = 4;
                        });
                      },
                      child: Text.rich(
                        TextSpan(
                            text: (isClicked == true) && (clickedAns == 4)
                                ? '❹ '
                                : '④ ',
                            style: TextStyle(
                              fontSize: 25,
                              color: (isClicked == true) && (clickedAns == 4)
                                  ? Palette.happyLime
                                  : Palette.signitureGreen,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -1,
                            ),
                            children: [
                              TextSpan(
                                  text: examData[qIndex]['options'][3],
                                  style: TextStyle(
                                    color:
                                        (isClicked == true) && (clickedAns == 4)
                                            ? Palette.happyLime
                                            : Colors.black,
                                    fontSize: 20,
                                    fontWeight:
                                        (isClicked == true) && (clickedAns == 4)
                                            ? FontWeight.w700
                                            : FontWeight.w300,
                                    shadows: [
                                      Shadow(
                                          color: (isClicked == true) &&
                                                  (clickedAns == 4)
                                              ? Colors.black.withOpacity(0.3)
                                              : Colors.transparent,
                                          offset: const Offset(1, 1))
                                    ],
                                    letterSpacing: -1,
                                  )),
                            ]),
                      ),
                    ),
                  ],
                ),
                const Spacer(
                  flex: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      color: qIndex > 0 ? Palette.signitureGreen : Colors.grey,
                      iconSize: 33,
                      icon: const Icon(Icons.arrow_circle_left_outlined),
                      onPressed: () {
                        if (qIndex > 0) {
                          // print(qIndex);
                          _prevQuestion();
                        }
                        print(qIndex);
                      },
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // _nextQuestion();
                          final answerNum = examData[qIndex]['a_num'];
                          if (clickedAns == answerNum) {
                            final correctSnackBar = SnackBar(
                              backgroundColor: Palette.signitureGreen,
                              content: const Text('맞았습니다!'),
                              duration: const Duration(seconds: 120),
                              action: SnackBarAction(
                                  label: '다음 문제로',
                                  textColor:
                                      const Color.fromARGB(255, 204, 240, 132),
                                  onPressed: () {
                                    _nextQuestion();
                                  }),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(correctSnackBar);
                          } else if (clickedAns == 0) {
                            const zeroSnackbar = SnackBar(
                              backgroundColor: Palette.signitureGreen,
                              content: Text('먼저 답을 선택해주세요.'),
                              duration: Duration(seconds: 2),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(zeroSnackbar);
                          } else if (wrongChecked < 1) {
                            _wrongChecked();
                            const wrongSnackBar = SnackBar(
                                duration: Duration(seconds: 2),
                                backgroundColor: Palette.signitureGreen,
                                content: Text('틀렸습니다! 한번만 다시 생각해보세요:('));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(wrongSnackBar);
                          } else {
                            final wrongTwiceSnackBar = SnackBar(
                              backgroundColor: Palette.signitureGreen,
                              duration: const Duration(seconds: 120),
                              content: Text('틀렸습니다. 정답은 $answerNum번입니다.'),
                              action: SnackBarAction(
                                  label: '다음 문제로',
                                  textColor:
                                      const Color.fromARGB(255, 204, 240, 132),
                                  onPressed: () {
                                    _nextQuestion();
                                  }),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(wrongTwiceSnackBar);
                            setState(() {
                              wrongChecked = 0;
                              answerRateReduced++;
                              print(answerRateReduced);
                            });
                          }
                        },
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Palette.signitureGreen),
                        ),
                        child: const Text('채점하기',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -1,
                            ))),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.orange.shade600),
                      ),
                      child: const Text(
                        '해설보기',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -1,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    CircularPercentIndicator(
                      header: const Padding(
                        padding: EdgeInsets.only(bottom: 3.0),
                        child: Text(
                          '정답률',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                      animation: true,
                      animateFromLastPercent: true,
                      radius: 20.0,
                      lineWidth: 4.0,
                      percent: (100 - answerRateReduced) / 100,
                      center: Text.rich(
                        TextSpan(
                          text: (100 - answerRateReduced).toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                          ),
                          children: const [
                            TextSpan(
                                text: "%",
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 10))
                          ],
                        ),
                      ),
                      progressColor: Palette.grapePurple,
                    ),
                  ],
                ),
                const Spacer(
                  flex: 3,
                ),
              ],
            )));
  }
}

// class RenderQuestion extends StatefulWidget {
//   // this.qIndex
//   //   var clickedAns = 0;

//   // bool isClicked = false;

//   // var qIndex = Widget.qIndex;

//   const RenderQuestion({
//     super.key,
//     required this.examData,
//   });

//   @override
//   State<RenderQuestion> createState() => _RenderQuestionState();
// }

// class _RenderQuestionState extends State<RenderQuestion> {
//   late final String index = examData[qIndex]['index'];
//   late final String qNum = examData[qIndex]['q_num'];
//   late final int aNum = examData[qIndex]['a_num'];
//   late final String question = examData[qIndex]['question'];
//   late final String option1 = examData[qIndex]['options'][0];
//   late final String option2 = examData[qIndex]['options'][1];
//   late final String option3 = examData[qIndex]['options'][2];
//   late final String option4 = examData[qIndex]['options'][3];

//   void _nextQuestion() {
//     setState(() {
//       qIndex++;
//       isClicked = false;
//       clickedAns = 0;
//     });
//   }
//   // what happens at the end of the quiz
//   // if (_questionIndex >= 20) {
//   //   _resetQuiz();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // DataPicker(),

//         // const Spacer(
//         //   flex: 2,
//         // ),
//         ProgressBar(
//           index: index,
//         ),
//         const Spacer(
//           flex: 2,
//         ),
//         Text.rich(
//           TextSpan(
//               text: qNum,
//               style: const TextStyle(
//                 fontSize: 25,
//                 color: Palette.greenColor,
//                 fontWeight: FontWeight.w800,
//                 letterSpacing: -1,
//               ),
//               children: [
//                 const TextSpan(
//                     text: '_ ',
//                     style: TextStyle(
//                       // color: Colors.black,
//                       fontSize: 25,
//                       letterSpacing: -1,
//                     )),
//                 TextSpan(
//                     text: question,
//                     style: const TextStyle(
//                       color: Colors.black,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w300,
//                       letterSpacing: -1,
//                     )),
//               ]),
//         ),
//         const Spacer(
//           flex: 2,
//         ),
//         Row(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   isClicked = !isClicked;
//                   clickedAns = 1;
//                 });
//               },
//               child: Text.rich(
//                 TextSpan(
//                     text:
//                         (isClicked == true) && (clickedAns == 1) ? '❶ ' : '① ',
//                     style: TextStyle(
//                       fontSize: 25,
//                       color: (isClicked == true) && (clickedAns == 1)
//                           ? Palette.limeColor
//                           : Palette.greenColor,
//                       fontWeight: FontWeight.w800,
//                       letterSpacing: -1,
//                     ),
//                     children: [
//                       TextSpan(
//                           text: option1,
//                           style: TextStyle(
//                             color: (isClicked == true) && (clickedAns == 1)
//                                 ? Palette.limeColor
//                                 : Colors.black,
//                             fontSize: 20,
//                             fontWeight: (isClicked == true) && (clickedAns == 1)
//                                 ? FontWeight.w700
//                                 : FontWeight.w300,
//                             shadows: [
//                               Shadow(
//                                   color:
//                                       (isClicked == true) && (clickedAns == 1)
//                                           ? Colors.black.withOpacity(0.3)
//                                           : Colors.transparent,
//                                   offset: const Offset(1, 1))
//                             ],
//                             letterSpacing: -1,
//                           )),
//                     ]),
//               ),
//             ),
//             const SizedBox(
//               width: 60,
//             ),
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   isClicked = !isClicked;
//                   clickedAns = 2;
//                 });
//               },
//               child: Text.rich(
//                 TextSpan(
//                     // recognizer: TapGestureRecognizer()
//                     //   ..onTap = () {
//                     //     setState(() {
//                     //       isClicked = !isClicked;
//                     //       clickedAns = 2;
//                     //       // print(clickedAns);
//                     //       // print(isClicked);
//                     //     });
//                     //   },
//                     text:
//                         (isClicked == true) && (clickedAns == 2) ? '❷ ' : '② ',
//                     style: TextStyle(
//                       fontSize: 25,
//                       color: (isClicked == true) && (clickedAns == 2)
//                           ? Palette.limeColor
//                           : Palette.greenColor,
//                       fontWeight: FontWeight.w800,
//                       letterSpacing: -1,
//                     ),
//                     children: [
//                       TextSpan(
//                           text: option2,
//                           style: TextStyle(
//                             color: (isClicked == true) && (clickedAns == 2)
//                                 ? Palette.limeColor
//                                 : Colors.black,
//                             fontSize: 20,
//                             fontWeight: (isClicked == true) && (clickedAns == 2)
//                                 ? FontWeight.w700
//                                 : FontWeight.w300,
//                             shadows: [
//                               Shadow(
//                                   color:
//                                       (isClicked == true) && (clickedAns == 2)
//                                           ? Colors.black.withOpacity(0.3)
//                                           : Colors.transparent,
//                                   offset: const Offset(1, 1))
//                             ],
//                             letterSpacing: -1,
//                           )),
//                     ]),
//               ),
//             ),
//           ],
//         ),
//         const Spacer(
//           flex: 1,
//         ),
//         Row(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   isClicked = !isClicked;
//                   clickedAns = 3;
//                 });
//               },
//               child: Text.rich(
//                 TextSpan(
//                     text:
//                         (isClicked == true) && (clickedAns == 3) ? '❸ ' : '③ ',
//                     style: TextStyle(
//                       fontSize: 25,
//                       color: (isClicked == true) && (clickedAns == 3)
//                           ? Palette.limeColor
//                           : Palette.greenColor,
//                       fontWeight: FontWeight.w800,
//                       letterSpacing: -1,
//                     ),
//                     children: [
//                       TextSpan(
//                           text: option3,
//                           style: TextStyle(
//                             color: (isClicked == true) && (clickedAns == 3)
//                                 ? Palette.limeColor
//                                 : Colors.black,
//                             fontSize: 20,
//                             fontWeight: (isClicked == true) && (clickedAns == 3)
//                                 ? FontWeight.w700
//                                 : FontWeight.w300,
//                             shadows: [
//                               Shadow(
//                                   color:
//                                       (isClicked == true) && (clickedAns == 3)
//                                           ? Colors.black.withOpacity(0.3)
//                                           : Colors.transparent,
//                                   offset: const Offset(1, 1))
//                             ],
//                             letterSpacing: -1,
//                           )),
//                     ]),
//               ),
//             ),
//             const SizedBox(
//               width: 60,
//             ),
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   isClicked = !isClicked;
//                   clickedAns = 4;
//                 });
//               },
//               child: Text.rich(
//                 TextSpan(
//                     text:
//                         (isClicked == true) && (clickedAns == 4) ? '❹ ' : '④ ',
//                     style: TextStyle(
//                       fontSize: 25,
//                       color: (isClicked == true) && (clickedAns == 4)
//                           ? Palette.limeColor
//                           : Palette.greenColor,
//                       fontWeight: FontWeight.w800,
//                       letterSpacing: -1,
//                     ),
//                     children: [
//                       TextSpan(
//                           text: option4,
//                           style: TextStyle(
//                             color: (isClicked == true) && (clickedAns == 4)
//                                 ? Palette.limeColor
//                                 : Colors.black,
//                             fontSize: 20,
//                             fontWeight: (isClicked == true) && (clickedAns == 4)
//                                 ? FontWeight.w700
//                                 : FontWeight.w300,
//                             shadows: [
//                               Shadow(
//                                   color:
//                                       (isClicked == true) && (clickedAns == 4)
//                                           ? Colors.black.withOpacity(0.3)
//                                           : Colors.transparent,
//                                   offset: const Offset(1, 1))
//                             ],
//                             letterSpacing: -1,
//                           )),
//                     ]),
//               ),
//             ),
//           ],
//         ),
//         const Spacer(
//           flex: 3,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             ElevatedButton(
//                 onPressed: () {
//                   if (clickedAns == aNum) {
//                     final snackBar = SnackBar(
//                       backgroundColor: Palette.greenColor,
//                       content: const Text('맞았습니다!'),
//                       action: SnackBarAction(
//                           label: '다음 문제로',
//                           textColor: const Color.fromARGB(255, 204, 240, 132),
//                           onPressed: () {
//                             _nextQuestion();
//                           }),
//                     );
//                     ScaffoldMessenger.of(context).showSnackBar(snackBar);

//                     _nextQuestion();
//                   } else {
//                     print('wr');
//                   }
//                 },
//                 style: const ButtonStyle(
//                   backgroundColor: MaterialStatePropertyAll(Palette.greenColor),
//                 ),
//                 child: const Text('채점하기',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w500,
//                       letterSpacing: -1,
//                     ))),
//             ElevatedButton(
//               onPressed: () {},
//               style: ButtonStyle(
//                 backgroundColor:
//                     MaterialStatePropertyAll(Colors.orange.shade600),
//               ),
//               child: const Text(
//                 '해설보기',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w500,
//                   letterSpacing: -1,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               width: 5,
//             ),
//             CircularPercentIndicator(
//               header: const Padding(
//                 padding: EdgeInsets.only(bottom: 3.0),
//                 child: Text(
//                   '정답률',
//                   style: TextStyle(fontSize: 10),
//                 ),
//               ),
//               animation: true,
//               animateFromLastPercent: true,
//               radius: 20.0,
//               lineWidth: 4.0,
//               percent: 1,
//               center: const Text.rich(
//                 TextSpan(
//                   text: "100",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w800,
//                   ),
//                   children: [
//                     TextSpan(
//                         text: "%",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w800, fontSize: 10))
//                   ],
//                 ),
//               ),
//               progressColor: Palette.limeColor,
//             ),
//           ],
//         ),
//         const Spacer(
//           flex: 3,
//         ),
//       ],
//     );
//   }

