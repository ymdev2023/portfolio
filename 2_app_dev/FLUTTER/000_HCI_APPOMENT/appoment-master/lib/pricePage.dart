import 'package:appoment/homePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'controller/auth_controller.dart';
import 'data/appointment.dart';
import 'data/repository/appointment_repository.dart';

class PricePage extends StatefulWidget {
  final String title; // title 변수 추가
  final DateTime? selectedDateTime;
  final String selectedPrice;

  const PricePage({
    super.key,
    required this.title,
    this.selectedDateTime,
    required this.selectedPrice,
  });

  @override
  State<PricePage> createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
  final AppointmentRepository _appointmentRepository = AppointmentRepository();
  final auth = AuthController.to;
  List<Appointment> appoList = [];

  @override
  void initState() {
    super.initState();
    _appointmentRepository.findAllByMemberId(auth.member!.id).then((data) {
      setState(() {
        appoList = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff4586FF),
      appBar: AppBar(
        backgroundColor: Color(0xff4586FF),
        centerTitle: true,
        title: Text(
          "성실 수익 조회",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w800),
        ),
        leading: Padding(
          padding: EdgeInsets.all(0),
          child: IconButton(
            onPressed: () {
              Get.offAll(HomePage());
            },
            icon: Image(
              image: AssetImage("assets/images/white_logo.png"),
              width: 40,
              height: 40,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                size: 40,
              ),
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.fromLTRB(20, 30, 20, 30),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '다가오는 약속',
                        style: TextStyle(
                            fontSize: 21,
                            color: Color(0xff4586FF),
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ...appoList.map((appo) =>
                          appo.date.difference(DateTime.now()).isNegative
                              ? SizedBox(
                                  height: 0,
                                )
                              : Row(
                                  children: [
                                    Text(
                                      "${DateFormat('MM/dd\t').format(appo.date)}${appo.title}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "${appo.penalty}원",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                      // : Text(
                      //     "${DateFormat('MM/dd\t').format(appo.date)}${appo.title}             ${appo.penalty}원",
                      //     style: TextStyle(
                      //         fontSize: 18, fontWeight: FontWeight.w500))),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '지난 약속',
                        style: TextStyle(
                            fontSize: 21,
                            color: Color(0xff4586FF),
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ...appoList.map((appo) =>
                          !appo.date.difference(DateTime.now()).isNegative
                              ? SizedBox(
                                  height: 0,
                                )
                              : Row(
                                  children: [
                                    Text(
                                      "${DateFormat('MM/dd\t').format(appo.date)}${appo.title}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "${appo.penalty}원",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                    ],
                  ),
                )),
          ),
          Stack(
            children: [
              Container(
                width: _size.width, // 반원의 가로 길이 설정
                height: 200, // 반원의 세로 길이 설정
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: ClipOval(
                  child: Container(
                    color: Colors.white, // 반원의 색상 설정
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  width: _size.width,
                  height: 150,
                  color: Colors.white,
                ),
                top: 100,
              ),
              Positioned.fill(
                top: 20,
                child: Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      margin: EdgeInsets.all(4),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xff4586FF)),
                      width: 150,
                      height: 70,
                      child: Center(
                          child: const Text(
                        '뒤로가기',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      )),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
