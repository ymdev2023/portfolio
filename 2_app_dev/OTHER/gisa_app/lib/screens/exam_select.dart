import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gisa_app/src/note_data.dart';

import '../config/color_palette.dart';
import 'exam_view.dart';
import 'home.dart';

class ExamSelectScreen extends StatefulWidget {
  const ExamSelectScreen({super.key});

  @override
  State<ExamSelectScreen> createState() => _ExamSelectScreenState();
}

class _ExamSelectScreenState extends State<ExamSelectScreen> {
  final List<String> examList = <String>[
    '2020년도 1-2회 ',
    '2020년도 3회 ',
    '2020년도 4회 ',
    '2021년도 1회 ',
    '2021년도 2회 ',
    '2021년도 3회 ',
    '2022년도 1회 ',
    '2022년도 2회 ',
  ];
  String contentsHashed = '';
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    void _isInList() {
      List<dynamic> notes = noteData;

      for (dynamic note in notes) {
        if (note['hashtag'].contains('소프트웨어공학')) {
          contentsHashed = note['contents'];
          print(contentsHashed);
        } else {
          print('not contain');
        }
      }
    }

    var dropdownValue = examList.first;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.signitureGreen,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const HomeScreen();
                },
              ),
            );
          },
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider(
                options: CarouselOptions(height: 200.0),
                items: ['연도별', '과목별', '주제별'].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(250, 200),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            elevation: 3,
                            backgroundColor: Palette.summerGreen),
                        child: Text(i,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20)),
                      );
                     //   Container(
                      //       width: MediaQuery.of(context).size.width,
                      //       margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      //       decoration: const BoxDecoration(color: Colors.amber),
                      //       child: Text(
                      //         i,
                      //         style: const TextStyle(fontSize: 36.0),
                      //       ));
                    },
                  );
                }).toList(),
              ),
              const Spacer(
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 3,
                        backgroundColor: Palette.summerGreen),
                    child: const Text('연도별',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20)),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('과목별',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20)),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('주제별',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20)),
                  )
                  // TextButton.icon(
                  //   onPressed: () {},
                  //   icon: const Icon(
                  //     Icons.calendar_month_outlined,
                  //     size: 35,
                  //   ),
                  //   label: const Text(' 연도별',
                  //       style: TextStyle(
                  //           fontWeight: FontWeight.w600, fontSize: 20)),
                  //   style: TextButton.styleFrom(
                  //     padding: const EdgeInsets.all(15),
                  //     foregroundColor: Colors.white,
                  //     backgroundColor: Palette.summerGreen,
                  //     shadowColor: Colors.black.withOpacity(0.7),
                  //     elevation: 4,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(30),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              const Spacer(
                flex: 1,
              ),
              CustomDropdownButton2(
                buttonWidth: MediaQuery.of(context).size.width * 0.85,
                dropdownWidth: MediaQuery.of(context).size.width * 0.85,
                hint: '풀이하시려는 회차를 선택해주세요.',
                dropdownItems: examList,
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
              ),
              const Spacer(
                flex: 1,
              ),
              if (selectedValue != null)
                Center(
                  child: TextButton.icon(
                    onPressed: () {
                      if (selectedValue == examList[0]) {
                        setState(() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const ExamViewScreen();
                          }));
                        });
                      }

                      // _isInList();
                    },
                    icon: const Icon(
                      Icons.edit,
                      size: 30,
                    ),
                    label: Text('$selectedValue풀기',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20)),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(13),
                      foregroundColor: Colors.white,
                      backgroundColor: Palette.grapePurple,
                      shadowColor: Colors.black.withOpacity(0.7),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              if (contentsHashed.isNotEmpty)
                Text(
                  contentsHashed,
                  maxLines: 2,
                ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
