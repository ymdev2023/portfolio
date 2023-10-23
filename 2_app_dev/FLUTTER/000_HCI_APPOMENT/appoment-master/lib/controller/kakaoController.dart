import 'package:appoment/controller/auth_controller.dart';
import 'package:appoment/data/member.dart';
import 'package:appoment/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:kakao_flutter_sdk_friend/kakao_flutter_sdk_friend.dart';
import 'package:kakao_flutter_sdk_talk/kakao_flutter_sdk_talk.dart';

import '../loginPage.dart';


class KakaoController extends GetxController {
  RxBool isKakaoLoggedIn = false.obs;

  static KakaoController get to => Get.find();


  @override
  void onInit() {
    super.onInit();
    _initKakaoLoginStatus();
  }

  Future<void> _initKakaoLoginStatus() async {
    final installed = await isKakaoTalkInstalled();
    print('KakaoTalk installed: $installed');

    final loggedIn = await isKakaoLoggedIn();
    print('KakaoTalk logged in: $loggedIn');
    isKakaoLoggedIn.value = loggedIn;
  }

  Future<void> loginWithKakao() async {
    try {
      final installed = await isKakaoTalkInstalled();
      OAuthToken tokenRes;

      if (installed) {

        tokenRes = await UserApi.instance.loginWithKakaoTalk();
      } else {
        tokenRes = await UserApi.instance.loginWithKakaoAccount();
      }

      User user = await UserApi.instance.me();
      print('User: $user');

      isKakaoLoggedIn.value = true;
      await AuthController.to.register(Member.fromKakao(user));
      Get.off(()=>HomePage());

    } catch (e) {
      print('Error on login: $e');
    }
  }

  Future<void> logoutFromKakao() async {
    try {
      await UserApi.instance.logout();
      isKakaoLoggedIn.value = false;
      AuthController.to.logout();
      Get.offAll( ()=>LoginPage());
    } catch (e) {
      print('Error on logout: $e');
    }
  }
  Future<void> getPicker(BuildContext context, Function(SelectedUsers? users) updateParticipants) async{
    // 파라미터 설정
    var params = PickerFriendRequestParams(
      title: '멀티 친구 피커',
      enableSearch: true,
      showMyProfile: false,
      showFavorite: true,
      showPickedFriend: null,
      maxPickableCount: null,
      minPickableCount: 1,
      enableBackButton: true,
    );

    await checkScope();
    // 피커 호출
    try {
      SelectedUsers users = await PickerApi.instance.selectFriends(params: params, context: context);
      print('친구 선택 성공: ${users.users!.length}');
      updateParticipants(users);
    } catch(e) {
      print('친구 선택 실패: $e');
    }
  }
  Future<void> checkScope() async {
    User user;
    try {
      user = await UserApi.instance.me();
    } catch (error) {
      print('사용자 정보 요청 실패 $error');
      return;
    }
    // 사용자의 추가 동의가 필요한 사용자 정보 동의 항목 확인
    List<String> scopes = [];

    scopes.add("friends");

    if (scopes.length > 0) {
      print('사용자에게 추가 동의 받아야 하는 항목이 있습니다');

      // OpenID Connect 사용 시
      // scope 목록에 "openid" 문자열을 추가하고 요청해야 함
      // 해당 문자열을 포함하지 않은 경우, ID 토큰이 재발급되지 않음
      // scopes.add("openid")

      // scope 목록을 전달하여 추가 항목 동의 받기 요청
      // 지정된 동의 항목에 대한 동의 화면을 거쳐 다시 카카오 로그인 수행
      OAuthToken token;
      try {
        token = await UserApi.instance.loginWithNewScopes(scopes);
        print('현재 사용자가 동의한 동의 항목: ${token.scopes}');
      } catch (error) {
        print('추가 동의 요청 실패 $error');
        return;
      }

      // 사용자 정보 재요청
      try {
        User user = await UserApi.instance.me();
        print('사용자 정보 요청 성공'
            '\n회원번호: ${user.id}'
            '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
            '\n이메일: ${user.kakaoAccount?.email}');
      } catch (error) {
        print('사용자 정보 요청 실패 $error');
      }
    }
  }

}