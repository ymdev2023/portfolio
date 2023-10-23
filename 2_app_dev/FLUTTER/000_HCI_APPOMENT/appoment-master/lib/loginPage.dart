import 'package:appoment/controller/kakaoController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'homePage.dart';

class LoginPage extends StatelessWidget {
  final kakaoController =KakaoController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4586FF),

      appBar: AppBar(
        backgroundColor: Color(0xff4586FF),

        title: Text(""),
        leading: Padding(padding: EdgeInsets.all(5),
          child: IconButton(
              onPressed: () {

              },
              icon: Image(
                image: AssetImage("assets/images/white_logo.png"),
                width: 40,
                height: 40,
              )),
        ),
        actions: [
          Padding(padding: EdgeInsets.all(5),
            child: IconButton(
              onPressed: () {
                },
              icon: Icon(Icons.settings,size: 40,),color: Colors.white,),
          )],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,

        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 100,),
          const Center(
            child: Text("약속을 만들기 위해",style:
              TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          ),
          const Center(
            child: Text("카카오톡과 연결합니다.",style:
              TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          ),
          const SizedBox(height: 50),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image(image: AssetImage("assets/images/pngwing.com.png"),color: Colors.yellow,width: 120,),
              GestureDetector(onTap: (){ kakaoController.loginWithKakao(); },child: Image(image: AssetImage("assets/images/Kakao_logo.jpg"),width: 80,)),

              RotatedBox(quarterTurns: 2,child: Image(image: AssetImage("assets/images/pngwing.com.png"),color: Colors.yellow,width: 120,),),

            ], ),
          Text("클릭!",style:
          TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),

        ],
      ),
    );
  }
}
