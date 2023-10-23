import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:webtoon_app/screens/home_screen.dart';
import 'package:webtoon_app/screens/splash_screen.dart';

void main() {
  KakaoSdk.init(nativeAppKey: 'c7cd316713f65ac75de7ce0f829ff917');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: TextTheme(
        bodySmall: TextStyle(fontFamily: "CookieRun"),
      )),
      home: SplashScreen(),
    );
  }
}
