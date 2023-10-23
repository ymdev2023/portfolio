import 'package:appoment/data/entity.dart';
import 'package:kakao_flutter_sdk_talk/kakao_flutter_sdk_talk.dart';

class Member extends Entity {
  @override
  final String id;
  final String nickname;
  final PlatformType platformType;
  final String profileImageUrl;

  Member({
    required this.id,
    required this.nickname,
    required this.platformType,
    required this.profileImageUrl,
  });

  Member.fromJson(dynamic json)
      : this(
          id: json['id'],
          nickname: json['nickname'],
          platformType: PlatformType.values
              .singleWhere((element) => element.name == json['platformType']),
          profileImageUrl: json['profileImageUrl'],
        );

  Member.fromKakao(User user)
      : this(
          id: user.id.toString(),
          nickname: user.kakaoAccount?.profile?.nickname ?? "알 수 없음",
          platformType: PlatformType.kakao,
          profileImageUrl: user.kakaoAccount?.profile?.profileImageUrl ?? "",
        );

  @override
  Map<String, Object?> toJson() {
    return {
      "id": id,
      "nickname": nickname,
      "platformType": platformType.name,
      "profileImageUrl": profileImageUrl,
    };
  }
}

enum PlatformType { kakao }
