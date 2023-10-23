import 'package:appoment/data/appointment.dart';
import 'package:appoment/data/repository/firebase_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentRepository extends FirebaseRepository<Appointment> {
  @override
  final String collectionName = 'appointments';

  @override
  Appointment mapItem(json) => Appointment.fromJson(json);

  Future<List<Appointment>> findAllByMemberId(String memberId) async {
    final result = await FirebaseFirestore.instance
        .collection(collectionName)
        .where('participants', arrayContains: memberId)
        .get();
    return result.docs.map((doc) => mapItem(doc.data())).toList();
  }

  Future<void> deleteAppointment(Appointment appointment) async {
    await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(appointment.id)
        .delete();
  }

  Future<void> saveAppointment(Appointment appointment) async {
    await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(appointment.id)
        .set(appointment.toJson());
  }
}
