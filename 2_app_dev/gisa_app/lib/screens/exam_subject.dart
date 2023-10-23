import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gisa_app/config/color_palette.dart';
import 'package:gisa_app/screens/home.dart';

class ExamSubjectScreen extends StatefulWidget {
  const ExamSubjectScreen({super.key});
  @override
  State<ExamSubjectScreen> createState() => _ExamSubjectScreenState();
}

class _ExamSubjectScreenState extends State<ExamSubjectScreen> {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  var name = "hello";
  final examList1 = List<String>.generate(20, (i) => "${i + 1}");
  final examList2 = List<String>.generate(20, (i) => "${i + 1}");
  final examList3 = List<String>.generate(20, (i) => "${i + 1}");
  final examList4 = List<String>.generate(20, (i) => "${i + 1}");
  final examList5 = List<String>.generate(20, (i) => "${i + 1}");
  bool isClicked = false;
  int subjectNum = 0;
  List<String> subjectList = ['1과목', '2과목', '3과목', '4과목', '5과목'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              '공부하실 과목을 선택하세요.',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 28,
                letterSpacing: -1,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 0.2,
                ),
                GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        isClicked = !isClicked;
                        subjectNum = 1;
                        // print(isClicked);
                      },
                    );
                  },
                  child: Column(
                    children: [
                      Text(
                        subjectList[0],
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          letterSpacing: -1,
                          color: (subjectNum == 1) && (isClicked = true)
                              ? Palette.signitureGreen
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isClicked = !isClicked;
                      subjectNum = 2;
                    });
                  },
                  child: Text(
                    subjectList[1],
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      letterSpacing: -1,
                      color: (subjectNum == 2) && (isClicked = true)
                          ? Palette.signitureGreen
                          : Colors.black,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isClicked = !isClicked;
                      subjectNum = 3;
                    });
                  },
                  child: Text(
                    subjectList[2],
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      letterSpacing: -1,
                      color: (subjectNum == 3) && (isClicked = true)
                          ? Palette.signitureGreen
                          : Colors.black,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isClicked = !isClicked;
                      subjectNum = 4;
                    });
                  },
                  child: Text(
                    subjectList[3],
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      letterSpacing: -1,
                      color: (subjectNum == 4) && (isClicked = true)
                          ? Palette.signitureGreen
                          : Colors.black,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isClicked = !isClicked;
                      subjectNum = 5;
                    });
                  },
                  child: Text(
                    subjectList[4],
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      letterSpacing: -1,
                      color: (subjectNum == 5) && (isClicked = true)
                          ? Palette.signitureGreen
                          : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 0.2,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            if (subjectNum == 1)
              ExamGrid(examList: examList1, gridColor: Colors.amber),
            if (subjectNum == 2)
              ExamGrid(examList: examList2, gridColor: Colors.lightGreen),
            if (subjectNum == 3)
              ExamGrid(examList: examList3, gridColor: Colors.lightBlueAccent),
            if (subjectNum == 4)
              ExamGrid(examList: examList4, gridColor: Colors.deepPurpleAccent),
            if (subjectNum == 5)
              ExamGrid(examList: examList5, gridColor: Colors.deepOrangeAccent),
            TextField(
              controller: TextEditingController(),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'contents'),
            ),
            Text(name),
            ElevatedButton(
              onPressed: () async {
                DocumentSnapshot testData =
                    await fireStore.collection('exams').doc('exam1').get();
                print(testData.id);
                setState(() {
                  name = testData['name'];
                });
                // fireStore.collection('posts').doc().set({
                //   "subjectNum": subjectNum,
                // });
              },
              child: const Text('업로드'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
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
    );
  }
}

class ExamGrid extends StatelessWidget {
  const ExamGrid({
    super.key,
    required this.examList,
    required this.gridColor,
  });

  final List<String> examList;
  final Color gridColor;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: examList == null ? 0 : examList.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, childAspectRatio: 1),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => print(examList[index]),
            child: Container(
              margin: const EdgeInsets.all(2),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: gridColor,
                borderRadius: BorderRadius.circular(5),
              ),
              // width: 95,
              child: Text(
                textAlign: TextAlign.center,
                examList[index],
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
          );
        });
  }
}
