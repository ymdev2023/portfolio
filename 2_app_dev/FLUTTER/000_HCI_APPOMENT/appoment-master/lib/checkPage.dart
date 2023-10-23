import 'package:appoment/controller/auth_controller.dart';
import 'package:appoment/data/appointment.dart';
import 'package:appoment/data/repository/appointment_repository.dart';
import 'package:appoment/homePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CheckPage extends StatefulWidget {
  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  final AppointmentRepository _appointmentRepository = AppointmentRepository();
  final auth = AuthController.to;
  List<Appointment> appoList = [];

  @override
  void initState() {
    super.initState();
    _loadAppointments(); // 초기 약속 목록 로드
  }

  void deleteAppointment(Appointment appointment) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('약속 삭제'),
        content: Text('약속을 삭제하시겠습니까?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('아니오'),
          ),
          TextButton(
            onPressed: () async {
              await _appointmentRepository.delete(appointment.id);
              appoList.remove(appointment); // 약속 삭제
              setState(() {}); // 상태 업데이트
              Navigator.of(context).pop();
            },
            child: Text('예'),
          ),
        ],
      ),
    );
  }

  void _loadAppointments() {
    _appointmentRepository.findAllByMemberId(auth.member!.id).then((data) {
      setState(() {
        appoList = data;
      });
    }).catchError((error) {
      // 에러 처리
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
          "약속 조회",
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
                color: Colors.white,
              ),
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
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ...appoList.map(
                      (appo) => appo.date
                              .isBefore(DateTime.now()) // 현재 날짜 이전의 약속만 필터링
                          ? SizedBox(
                              height: 0,
                            )
                          : ListTile(
                              contentPadding: EdgeInsets.all(0), // 모든 패딩 제거
                              title: Text(
                                "${DateFormat('MM/dd\thh:mm\t').format(appo.date)}  ${appo.title}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                iconSize: 24,
                                onPressed: () => deleteAppointment(appo),
                              ),
                            ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '지난 약속',
                      style: TextStyle(
                        fontSize: 21,
                        color: Color(0xff4586FF),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ...appoList.map(
                      (appo) =>
                          appo.date.isAfter(DateTime.now()) // 현재 날짜 이후의 약속만 필터링
                              ? SizedBox(
                                  height: 0,
                                )
                              : ListTile(
                                  contentPadding: EdgeInsets.all(0), // 모든 패딩 제거
                                  title: Text(
                                    "${DateFormat('MM/dd\thh:mm\t').format(appo.date)}  ${appo.title}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  trailing: IconButton(
                                    padding: EdgeInsets.all(0),
                                    icon: Icon(Icons.delete),
                                    iconSize: 24,
                                    onPressed: () => deleteAppointment(appo),
                                  ),
                                ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
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
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xff4586FF),
                      ),
                      width: 130,
                      height: 70,
                      child: Center(
                        child: const Text(
                          '뒤로가기',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
