import 'package:appoment/data/appointment.dart';
import 'package:appoment/data/repository/appointment_repository.dart';
import 'package:appoment/homePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kakao_flutter_sdk_friend/kakao_flutter_sdk_friend.dart';

import 'controller/auth_controller.dart';
import 'controller/kakaoController.dart';
import 'controller/location_controller.dart';
import 'core/kakao_map_controller.dart';
import 'core/secret.dart';
import 'data/place.dart';
import 'library/kakaomap_webview_custom/kakaomap_view.dart';

class MakePage extends StatefulWidget {
  const MakePage({Key? key}) : super(key: key);

  @override
  State<MakePage> createState() => _MakePageState();
}

class _MakePageState extends State<MakePage> {
  final List<String> participants = [];
  final Map<String, String?> profileImagemap = {};
  final Map<String, String> profileNicknamemap = {};

  final auth = AuthController.to;
  final location = LocationController.to;
  late KakaoMapController _controller;
  final kakaoController = KakaoController.to;
  final AppointmentRepository _appointmentRepository = AppointmentRepository();

  TextEditingController titleInputController = TextEditingController();
  TextEditingController punctualInputController = TextEditingController();
  String title = "";
  DateTime? _selectedDateTime;
  Place? _selectedPlace;
  double _punctualInput = 0.0;

  void initParticipants() {
    participants.clear();
    profileImagemap.clear();
    profileNicknamemap.clear();
    participants.add(auth.member!.id);
    profileImagemap[auth.member!.id] = auth.member!.profileImageUrl;
    profileNicknamemap[auth.member!.id] = auth.member!.nickname;
  }

  updateParticipants(SelectedUsers? users) {
    setState(() {
      initParticipants();
      if (users != null && users.users != null) {
        for (var user in users.users!) {
          var id = user.id!;
          participants.add(id);
          profileNicknamemap[id] = user.profileNickname!;
          profileImagemap[id] = user.profileThumbnailImage!;
        }
      }
    });
  }

  Future<void> _selectDateAndTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (pickedDate == null) return;

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime == null) return;

    setState(() {
      _selectedDateTime = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    location.loadCurrentLocation();
    initParticipants();
  }

  // 장소입력 다이얼로그
  Future<Place?> _showPlaceDialog() {
    Place? place;
    return showDialog<Place?>(
      context: context,
      builder: (BuildContext context) {
        TextEditingController customController = TextEditingController();

        return AlertDialog(
            content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: KakaoMapView(
                    draggableMarker: true,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    kakaoMapKey: Secret.kakaoMapKey,
                    lat: location.latitude,
                    lng: location.longitude,
                    mapController: (controller) {
                      setState(() {
                        _controller = KakaoMapController(controller);
                      });
                    },
                    onMapLoadFinished: () async {
                      _controller.registerClickEvent();
                    },
                    customScript: '''
                      // 지도를 클릭한 위치에 표출할 마커입니다
                      var marker = new kakao.maps.Marker({
                          // 지도 중심좌표에 마커를 생성합니다
                          position: map.getCenter()
                      });
                      // 지도에 마커를 표시합니다
                      marker.setMap(map);


                      kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

                          // 클릭한 위도, 경도 정보를 가져옵니다
                          var latlng = mouseEvent.latLng;

                          // 마커 위치를 클릭한 위치로 옮깁니다
                          marker.setPosition(latlng);
                      });

                      ''',
                    onMapClicked: (latlng) {
                      place = Place(
                          name: "",
                          latitude: latlng.lat!,
                          longitude: latlng.lng!);
                    },
                  )),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: '장소 이름을 입력해주세요',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                        gapPadding: 0)),
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
                controller: customController,
                onChanged: (value) {},
              ),
              TextButton(
                child: const Text('확인'),
                onPressed: () {
                  if (customController.text != "" && place != null) {
                    place = Place(
                        name: customController.text,
                        latitude: place!.latitude,
                        longitude: place!.longitude);
                    Navigator.pop(context, place);
                  } else {
                    Navigator.pop(context, null);
                  }
                },
              ),
            ],
          ),
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff4586FF),
      appBar: AppBar(
        backgroundColor: const Color(0xff4586FF),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "약속 생성",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w800),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            onPressed: () {
              Get.offAll(HomePage());
            },
            icon: const Image(
              image: AssetImage("assets/images/white_logo.png"),
              width: 40,
              height: 40,
            ),
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                size: 40,
              ),
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 16),
        child: SizedBox(
          height: MediaQuery.of(context).size.height - kToolbarHeight - 13,
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 40, 0),
                  child: Row(
                    children: [
                      const Text(
                        '제목',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(10, 3, 10, 3),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: '"HCI 팀 미팅"과 같이 회의 제목을 입력하세요',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                  gapPadding: 0)),
                          style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                          controller: titleInputController,
                          onChanged: (value) {
                            setState(() {
                              title = value;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 40, 0),
                  child: Row(
                    children: [
                      const Text(
                        '일정',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _selectDateAndTime(context),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 15, 10, 15),
                              child: Text(
                                _selectedDateTime == null
                                    ? '여기를 눌러 날짜와 시간을 선택하세요'
                                    : DateFormat("yy/MM/dd hh:mm")
                                        .format(_selectedDateTime!),
                                style: TextStyle(
                                  fontSize: 15,
                                  color: _selectedDateTime == null
                                      ? Colors.grey
                                      : Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 40, 0),
                  child: Row(
                    children: [
                      const Text(
                        '장소',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _showPlaceDialog().then((place) {
                              setState(() {
                                _selectedPlace = place;
                              });
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 15, 10, 15),
                              child: Text(
                                _selectedPlace == null
                                    ? '여기를 눌러 장소를 선택하세요'
                                    : _selectedPlace!.name,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: _selectedPlace == null
                                      ? Colors.grey
                                      : Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 40, 0),
                  child: Row(
                    children: [
                      const Text(
                        '패널티',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          children: [
                            const SizedBox(height: 20), // 슬라이더 위 여백 조정
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Colors.white,
                                inactiveTrackColor:
                                    Colors.white.withOpacity(0.5),
                                thumbColor: Colors.white,
                                overlayColor: Colors.white.withOpacity(0.3),
                                thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 8.0,
                                ),
                                overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 16.0,
                                ),
                                trackHeight: 8.0,
                              ),
                              child: Slider(
                                value: _punctualInput,
                                min: 0.0,
                                max: 100000.0,
                                onChanged: (value) {
                                  setState(() {
                                    _punctualInput =
                                        (value / 500).round() * 500;
                                  });
                                },
                              ),
                            ),
                            Text(
                              _punctualInput.toStringAsFixed(0) + "원",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Align(
                  alignment: Alignment.center,
                  child: Text(
                      _selectedDateTime == null
                          ? ""
                          : '${DateFormat("M월 d일 hh:mm에\n").format(_selectedDateTime!)}${title}을 진행합니다.\n성실 수익은 ${_punctualInput.toStringAsFixed(0)}원입니다.',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                )),
                Container(
                  width: _size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(_size.width),
                      topRight: Radius.circular(_size.width),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 60,
                          width: _size.width * .6,
                          child: Align(
                              alignment: Alignment.center,
                              child: ListView.builder(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 1),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: participants.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Tooltip(
                                          message: profileNicknamemap[
                                              participants[index]],
                                          child: Image.network(profileImagemap[
                                              participants[index]]!)));
                                },
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 75,
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  kakaoController.getPicker(
                                      context, updateParticipants);
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(4),
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.yellowAccent),
                                  width: 170,
                                  height: 70,
                                  child: const Center(
                                      child: Text(
                                    '카카오톡 친구 초대',
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w600),
                                  )),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  if (checkMakeAppo()) {
                                    final created = Appointment(
                                        title: titleInputController.text,
                                        date: _selectedDateTime!,
                                        description: titleInputController.text,
                                        participants: participants,
                                        penalty: _punctualInput.round(),
                                        place: _selectedPlace!);
                                    await _appointmentRepository.save(created);
                                    Get.back();
                                  }
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(4),
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xff4586FF)),
                                  width: 100,
                                  height: 70,
                                  child: const Center(
                                      child: Text(
                                    '약속 생성',
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }

  checkMakeAppo() {
    if (titleInputController.text == "") {
      return false;
    }
    if (_selectedPlace == null) {
      return false;
    }
    if (_selectedDateTime == null) {
      return false;
    }
    if (participants.length <= 1) {
      return false;
    }
    return true;
  }
}
