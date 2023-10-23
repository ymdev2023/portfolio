import 'package:appoment/data/member_location.dart';
import 'package:appoment/data/repository/firebase_repository.dart';

class MemberLocationRepository extends FirebaseRepository<MemberLocation> {
  @override
  final String collectionName = 'member_locations';

  @override
  MemberLocation mapItem(json) => MemberLocation.fromJson(json);
}