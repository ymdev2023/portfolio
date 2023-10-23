import 'package:flutter/material.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 90, bottom: 10, left: 30, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '좋은 아침이에요, 김돼지님!',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 33,
                  color: Colors.black.withOpacity(0.6),
                  letterSpacing: -2),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '누르면 더 자세하게 볼 수 있어요.',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 27,
                  color: Colors.black.withOpacity(0.8),
                  letterSpacing: -2),
            ),
            GridView.count(
                childAspectRatio: 2 / 2.3,
                crossAxisCount: 2,
                shrinkWrap: true,
                children: [
                  Card(
                    margin: const EdgeInsets.all(10),
                    color: const Color.fromARGB(255, 181, 221, 118),
                    shadowColor: Colors.blueGrey,
                    elevation: 5,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "현재 몸무게",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Text(
                                    "67",
                                    style: TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "KG",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          subtitle: const Text(
                            '순조롭게 빠지고 있어요.',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.all(10),
                    color: const Color.fromARGB(255, 235, 133, 133),
                    shadowColor: Colors.blueGrey,
                    elevation: 5,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "목표 몸무게까지",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Text(
                                    "9.5",
                                    style: TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "KG",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          subtitle: const Center(
                            child: Text(
                              '남았어요.',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.all(10),
                    color: const Color.fromARGB(255, 255, 220, 65),
                    shadowColor: Colors.blueGrey,
                    elevation: 5,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Column(
                            children: [
                              const Text(
                                "지난 일주일 동안",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Text(
                                    "0.8",
                                    style: TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "KG",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          subtitle: const Center(
                            child: Text(
                              '감량했어요.',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.all(10),
                    color: const Color.fromARGB(255, 255, 171, 87),
                    shadowColor: Colors.blueGrey,
                    elevation: 5,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Column(
                            children: [
                              const Text(
                                "한달 동안",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Text(
                                    "3",
                                    style: TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "KG",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          subtitle: const Center(
                            child: Text(
                              '감량했어요.',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),

            // GridView.count(
            //   shrinkWrap: true,
            //   crossAxisCount: 2, // 열 수
            //   children: <Widget>[
            //     Container(
            //       color: Colors.red,
            //       width: 100,
            //       height: 100,
            //       padding: const EdgeInsets.all(8.0),
            //       margin: const EdgeInsets.all(8.0),
            //     ),
            //     Container(
            //       color: Colors.green,
            //       width: 100,
            //       height: 100,
            //       padding: const EdgeInsets.all(8.0),
            //       margin: const EdgeInsets.all(8.0),
            //     ),
            //     Container(
            //       color: Colors.blue,
            //       width: 100,
            //       height: 100,
            //       padding: const EdgeInsets.all(8.0),
            //       margin: const EdgeInsets.all(8.0),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
