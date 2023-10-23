import 'package:appoment/data/entity.dart';

class MemberLocation extends Entity {
  @override
  final String id;
  final double latitude;
  final double longitude;

  MemberLocation({
    required this.id,
    required this.latitude,
    required this.longitude,
  });

  MemberLocation.fromJson(dynamic json)
      : this(
          id: json['id'],
          latitude: json['latitude'],
          longitude: json['longitude'],
        );

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'latitude': latitude,
        'longitude': longitude,
      };
}
