import 'package:appoment/data/member.dart';
import 'package:appoment/data/repository/firebase_repository.dart';

class MemberRepository extends FirebaseRepository<Member> {
  @override
  final String collectionName = 'members';

  @override
  Member mapItem(json) => Member.fromJson(json);
}
