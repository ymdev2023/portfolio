import 'package:appoment/controller/auth_controller.dart';
import 'package:appoment/data/appointment.dart';
import 'package:appoment/data/member.dart';
import 'package:appoment/data/member_location.dart';
import 'package:appoment/data/repository/appointment_repository.dart';
import 'package:appoment/data/repository/member_location_repository.dart';
import 'package:appoment/data/repository/member_repository.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'map.dart';
import 'myPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AppointmentRepository _repository = AppointmentRepository();
  final auth = AuthController.to;
  Appointment? _appointment;
  List<Member> _members = [];
  List<MemberLocation> _locations = [];

  @override
  void initState() {
    super.initState();
    _repository.findAllByMemberId(auth.member!.id).then((data) {
      final recent = data
          .where((element) => element.date.isAfter(DateTime.now()))
          .reduce((curr, next) => curr.date.isBefore(next.date) ? curr : next);
      setState(() {
        _appointment = recent;
      });
      _getMembers();
      _getLocations();
    });
  }

  _getMembers() async {
    if (_appointment == null) return;

    final members =
        await MemberRepository().findAllByIds(_appointment!.participants);
    setState(() {
      _members = members;
    });
  }

  _getLocations() async {
    if (_appointment == null) return;

    final locations = await MemberLocationRepository()
        .findAllByIds(_appointment!.participants);
    setState(() {
      _locations = locations;
    });
  }

  Widget _renderItem(Member member) {
    final location =
        _locations.firstWhere((element) => element.id == member.id);
    final distance = _getDistance(location);
    final color = distance < 1000
        ? Colors.green
        : distance < 15000
            ? Colors.orange
            : Colors.red;

    final distanceText = distance < 1000
        ? "${distance.toInt()}m"
        : "${(distance / 1000).toStringAsFixed(1)}km";

    final bool isCloseToAppointment =
        _appointment!.date.isAfter(DateTime.now()) &&
            (distance / 250) * 70 <
                _appointment!.date.difference(DateTime.now()).inMinutes;

    return ListTileTheme(
      contentPadding: EdgeInsets.zero,
      child: ListTile(
        leading: Container(
          width: 48,
          height: 48,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Center(
            child: Text(
              member.nickname,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        title: Row(
          children: [
            Text(
              "도착까지 약 $distanceText 남았어요.",
              style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            Spacer(),
            Icon(
              isCloseToAppointment ? Icons.chat_bubble : Icons.warning,
              color: isCloseToAppointment ? Colors.green : Colors.red,
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        onTap: () {
          isCloseToAppointment ? _showConfirmationDialog(member) : null;
        },
      ),
    );
  }

  void _showConfirmationDialog(Member member) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("양해 메시지 보내기"),
          content: Text("다른 팀원들에게 양해 메시지를 보내시겠어요?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("아니요"),
            ),
            TextButton(
              onPressed: () {
                _showSnackbarNotification();
                Navigator.of(context).pop();
              },
              child: Text("예"),
            ),
          ],
        );
      },
    );
  }

  void _showSnackbarNotification() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "팀원이 양해 메시지를 보냈습니다. 조금만 기다려주세요!",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.green,
      ),
    );
  }

  double _getDistance(MemberLocation location) {
    if (_appointment == null) return 0;

    return Geolocator.distanceBetween(_appointment!.place.latitude,
        _appointment!.place.longitude, location.latitude, location.longitude);
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(""),
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/colored_logo.png',
              width: 40,
              height: 40,
            ),
            color: const Color(0xff4586FF),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: IconButton(
              onPressed: () {
                Get.to(myPage());
              },
              icon: const Icon(
                Icons.settings,
                size: 40,
              ),
              color: const Color(0xff4586FF),
            ),
          )
        ],
      ),
      body: _appointment != null
          ? Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Text(
                        "${_appointment!.date.month}월 ${_appointment!.date.day}일 ${_appointment!.date.hour}:${_appointment!.date.minute}에 ${_appointment!.place.name}에서",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: _appointment!.title,
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                            TextSpan(
                              text: " 약속이 있어요.",
                              style: TextStyle(
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: _size.width - 60,
                      height: 300,
                      child: MapPage(
                        appointment: _appointment!,
                        width: _size.width - 60,
                        height: 300,
                      ),
                    ),
                  ],
                ),
                SlidingUpPanel(
                  minHeight: 70,
                  maxHeight: 300,
                  panelBuilder: (scrollController) => CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Center(
                            child: Container(
                              width: 50,
                              height: 5,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate(
                          _members.map((e) => _renderItem(e)).toList(),
                        ),
                      )
                    ],
                  ),
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                  header: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: Center(
                      child: Container(
                        width: 50,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Container(),
    );
  }
}
