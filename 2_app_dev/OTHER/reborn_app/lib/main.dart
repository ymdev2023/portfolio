// RE:BORN

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:reborn_app/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); // Native code에서 플랫폼간 채널 통해 비동기적 이벤트 사용시 필요
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // var w = MediaQuery.of(context).size.width;
      // var h = MediaQuery.of(context).size.height;
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'GmarketSansTTF',
        // colorScheme: ColorScheme(background: Colors.white),
      ),

      home: AnimatedSplashScreen(
          splashIconSize: double.infinity,
          splash: Image.asset(
            'assets/images/reborn_logo.gif',
            fit: BoxFit.contain,
          ),
          duration: 3000,
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.white,
          nextScreen: const HomeScreen()),
      // home: const Home(),
    );
  }
}



// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Sqlite and Sqflite"),
//       ),
//       body: Container(
//         alignment: Alignment.topCenter,
//         padding: const EdgeInsets.all(20),
//         child: Column(children: [
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (BuildContext context) {
//                 return AddStudent();
//               }));
//             },
//             child: const Text("Add Student"),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (BuildContext context) {
//                 return ListStudents();
//               }));
//             },
//             child: const Text("List Student Record"),
//           ),
//         ]),
//       ),
//     );
//   }
// }
