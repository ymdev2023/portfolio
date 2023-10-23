import 'package:appoment/data/entity.dart';
import 'package:appoment/data/place.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Appointment extends Entity {
  @override
  final String id; // 약속 고유 id
  final String title; // 약속 제목
  final String description; // 약속 설명
  final DateTime date; // 약속 일자
  final Place place; // 약속 장소
  final List<String> participants; // 참여자 id 리스트
  final int penalty; // 지각 벌금

  Appointment._({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.place,
    required this.participants,
    required this.penalty,
  });

  Appointment({
    required String title,
    required String description,
    required DateTime date,
    required Place place,
    required List<String> participants,
    required int penalty,
  }) : this._(
          id: const Uuid().v4(),
          title: title,
          description: description,
          date: date,
          place: place,
          participants: participants,
          penalty: penalty,
        );

  Appointment.fromJson(dynamic json)
      : this._(
          id: json["id"] as String,
          title: json["title"] as String,
          description: json["description"] as String,
          date: (json["date"] as Timestamp).toDate(),
          place: Place.fromJson(json["place"]),
          participants: (json["participants"] as List).cast<String>(),
          penalty: json["penalty"] as int,
        );

  @override
  Map<String, Object?> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "date": date,
        "place": place.toJson(),
        "participants": participants,
        "penalty": penalty,
      };
}
