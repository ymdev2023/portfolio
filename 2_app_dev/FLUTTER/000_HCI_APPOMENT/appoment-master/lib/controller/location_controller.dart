import 'dart:async';

import 'package:appoment/core/location.dart';
import 'package:appoment/data/local/local_storage.dart';
import 'package:appoment/data/member_location.dart';
import 'package:appoment/data/repository/member_location_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  final MemberLocationRepository _repository = MemberLocationRepository();
  final LocalStorage _storage = LocalStorage();
  double latitude = 0;
  double longitude = 0;
  StreamSubscription<Position>? _subscription;

  static LocationController get to => Get.find();

  void updateLocation(double latitude, double longitude) async {
    this.latitude = latitude;
    this.longitude = longitude;
    await updateDatabase();
  }

  void loadCurrentLocation() async {
    final location = await LocationManager.getCurrentPosition();
    updateLocation(location.latitude, location.longitude);
  }

  void observe() {
    final stream = LocationManager.getPositionStream();
    _subscription = stream.listen((position) {
      updateLocation(position.latitude, position.longitude);
    });
  }

  void cancelObserve() {
    _subscription?.cancel();
  }

  Future<void> updateDatabase() async {
    final memberId = _storage.getAsString('memberId');
    if (memberId == null) {
      return;
    }
    final updated = MemberLocation(
      id: memberId,
      latitude: latitude,
      longitude: longitude,
    );
    _repository.save(updated);
  }
}
