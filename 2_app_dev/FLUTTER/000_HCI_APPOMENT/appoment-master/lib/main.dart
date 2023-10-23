import 'package:appoment/controller/init.dart';
import 'package:appoment/data/local/local_storage.dart';
import 'package:appoment/firebase_options.dart';
import 'package:appoment/loginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:kakao_flutter_sdk_talk/kakao_flutter_sdk_talk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initializeController();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await LocalStorage().initialize();

  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: '${"552cec45da17affeb1b9c7a72bff8985"}',
    javaScriptAppKey: '${"4404952915c3cf2a6151edd0eade6a8a"}',
  );
  String? url = await receiveKakaoScheme();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Pretendard",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
