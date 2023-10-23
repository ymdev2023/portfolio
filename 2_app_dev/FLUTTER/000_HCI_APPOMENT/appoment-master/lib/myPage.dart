import 'package:appoment/checkPage.dart';
import 'package:appoment/controller/kakaoController.dart';
import 'package:appoment/homePage.dart';
import 'package:appoment/makePage.dart';
import 'package:appoment/pricePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class myPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff4586FF),
      appBar: AppBar(
        backgroundColor: Color(0xff4586FF),
        centerTitle: true,
        title: Text(
          "마이페이지",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w800),
        ),
        leading: Padding(
          padding: EdgeInsets.all(0),
          child: IconButton(
            onPressed: () {
              Get.offAll(HomePage());
            },
            icon: Image(
              image: AssetImage("assets/images/white_logo.png"),
              width: 40,
              height: 40,
            ),
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                size: 40,
              ),
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(4),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  width: 400,
                  height: 70,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(CheckPage());
                    },
                    child: Center(
                      child: const Text(
                        '약속 조회',
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xff4586FF),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.all(4),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  width: 400,
                  height: 70,
                  child: GestureDetector(
                      onTap: () {
                        Get.to(MakePage());
                      },
                      child: Center(
                          child: const Text(
                        '약속 생성',
                        style: TextStyle(
                            fontSize: 30,
                            color: Color(0xff4586FF),
                            fontWeight: FontWeight.w700),
                      ))),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.all(4),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  width: 400,
                  height: 70,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(PricePage(
                        title: "Title",
                        selectedDateTime: DateTime.now(),
                        selectedPrice: "Price",
                      ));
                    },
                    child: Center(
                        child: const Text(
                      '성실 수익 관리',
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xff4586FF),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          Stack(
            children: [
              Container(
                width: _size.width, // 반원의 가로 길이 설정
                height: 200, // 반원의 세로 길이 설정
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: ClipOval(
                  child: Container(
                    color: Colors.white, // 반원의 색상 설정
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  width: _size.width,
                  height: 150,
                  color: Colors.white,
                ),
                top: 100,
              ),
              Positioned.fill(
                top: 20,
                child: Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      KakaoController.to.logoutFromKakao();
                    },
                    child: Container(
                      margin: EdgeInsets.all(4),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xff4586FF)),
                      width: 150,
                      height: 70,
                      child: Center(
                          child: const Text(
                        '로그아웃',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      )),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
