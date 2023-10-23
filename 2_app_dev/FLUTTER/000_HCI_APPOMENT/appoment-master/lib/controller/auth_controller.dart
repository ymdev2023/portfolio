import 'package:appoment/data/local/local_storage.dart';
import 'package:appoment/data/member.dart';
import 'package:appoment/data/repository/member_repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final _repository = MemberRepository();
  final _storage = LocalStorage();

  Member? member;

  static AuthController get to => Get.find();

  Future <void> register(Member member) async {
    await _repository.save(member);
    this.member = member;
    _storage.set('memberId', member.id);
    update();
  }

  void logout() async {
    member = null;
    _storage.set('memberId', null);
  }
}
