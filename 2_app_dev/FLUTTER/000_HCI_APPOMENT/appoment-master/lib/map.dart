import 'package:appoment/controller/auth_controller.dart';
import 'package:appoment/controller/location_controller.dart';
import 'package:appoment/core/kakao_map_controller.dart';
import 'package:appoment/core/secret.dart';
import 'package:appoment/data/appointment.dart';
import 'package:appoment/data/member_location.dart';
import 'package:appoment/data/repository/member_location_repository.dart';
import 'package:appoment/data/repository/member_repository.dart';
import 'package:appoment/library/kakaomap_webview_custom/kakao_latlng.dart';
import 'package:appoment/library/kakaomap_webview_custom/kakaomap_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:webview_flutter/platform_interface.dart';

class MapPage extends StatefulWidget {
  final Appointment appointment;
  final double width;
  final double height;

  const MapPage(
      {Key? key,
      required this.appointment,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late KakaoMapController _controller;
  final location = LocationController.to;
  final auth = AuthController.to;

  @override
  void initState() {
    super.initState();
    location.loadCurrentLocation();
    location.observe();
  }

  @override
  void dispose() {
    location.cancelObserve();
    super.dispose();
  }

  void _subscribePosition() {
    try {
      final streamList = MemberLocationRepository()
          .streamAllByIds(widget.appointment.participants);
      streamList.listen((event) {
        for (var element in event) {
          _update(element);
        }
      });
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  void _update(MemberLocation location) {
    _controller.updateMarkerPosition(location.id,
        KakaoLatLng(lat: location.latitude, lng: location.longitude));
  }

  void _onTapMarker(JavascriptMessage message) async {
    final memberId = message.message.toString().split(".")[0];
    final member = await MemberRepository().findById(memberId);
    final location = await MemberLocationRepository().findById(memberId);
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text(member!.nickname),
        content: Text(
          "약속 장소와의 거리: ${_getDistance(location!).toInt()}m"
        ),
      );
    });
  }

  double _getDistance(MemberLocation location) {
    return Geolocator.distanceBetween(
        widget.appointment.place.latitude,
        widget.appointment.place.longitude,
        location.latitude,
        location.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KakaoMapView(
        zoomLevel: 10,
        width: widget.width,
        height: widget.height,
        kakaoMapKey: Secret.kakaoMapKey,
        lat: widget.appointment.place.latitude,
        lng: widget.appointment.place.longitude,
        showMarker: true,
        onTapMarker: _onTapMarker,
        mapController: (controller) {
          setState(() {
            _controller = KakaoMapController(controller);
          });
        },
        onMapLoadFinished: () async {
          final members = await MemberRepository()
              .findAllByIds(widget.appointment.participants);

          for (var member in members) {
            final location =
                await MemberLocationRepository().findById(member.id);
            _controller.addMarker(Marker.from(
              member: member,
              latitude: location!.latitude,
              longitude: location.longitude,
            ));
          }
          _controller.registerClickEvent();
          _subscribePosition();
        }
      ),
    );
  }
}
