// 1

// void main() { // main : dart program's entry code, every code doing sth should be in here.
//   print('Hello world!'); // semicolon: CAREFUL!!
// }

// 2

// void main() {
//   var name = '니꼬'; // var: 함수나 메소드 내부에 지역 변수 선언 시, 업데이트 가능
//   name = 'nico'; // 변수를 수정할 때는 타입 유지
//   String name2 = 'nicco'; // type: 클래스에서 변수나 프로퍼티 선언 시
// }

// 3

// void main() {
//   var name; // type: dynamic

//   name = 'nico';
//   name = 12;
//   name = true;
//   dynamic name2;
//   if (name2 is String){
//     // I can use name2.___ autocomplete func.
//   }
// }

// 4

// // null safety: 개발자가 null값을 참조할 수 없게 runtime error(사용중 에러)를 띄워서 컴파일 전 경고
// void main() {
//   String? nico = 'nico'; // ?로 변수가 null일수도 있음을 말함
//   nico = null;
//   // if(nico != null) {
//   //   nico.isNotEmpty;
//   // }
//   nico?.isNotEmpty; // if nico is not null, plz give me isNotEmpty property.
// }

// 5

// void main() {
//   final String name = 'nico'; // 상수
//   name = 'nico'; // Not working
// }

// // 6

// void main() {
//   late final String name ; // 초기 데이터 없이 상수 만들고 api 등으로 받아와서 나중에 넣는다
//   name = 'nico';
//   // name = 'nicco'; // not gonna work
// }

// 7

// void main() {
//   const name = 'nico';// compile-time constant :  you know when you compile, not AFTER compile.
//   // name = 'blah' // not gonna work
//   // final API = fetchApi(); // you should use final when you use APIs.
//   const max_allowed_price = 120;
// }

// 8

// void main() {
//   String name = "nico"; // String, bool, ... : class object
//   bool alive = true;
//   int age = 12;
//   double money = 69.99;
//   num x = 12; // int or double
//   x = 1.1;
// }

// 9

// void main() {
//   var giveMeFive = true;
//   var numbers = [
//     1,
//     2,
//     3,
//     4,
//     if(giveMeFive) 5 // true면 5 더해라
//   ]; // 가능한 var 쓰기, 끝에 ,로 끝내면 예쁘게 포맷팅됨
//   print(numbers);
//   numbers.add(1);
//   numbers.last;
//   List<int> numbers2 = [
//     1,
//     2,
//     3,
//     4,
//   ];
// }

// 10

// void main() {
//   var name = 'nico';
//   var age = 10;
//   var greeting =
//       "Hello everyone, my name is $name and I'm ${age + 2}, nice to meet you!";
//   print(greeting);
// }

// 11

// void main() {
//   var oldFriends = ['nico', 'lynn'];
//   var newFriends = [
//     'lewis',
//     'ralph',
//     'darren',
//     for(var friend in oldFriends) "love $friend",

//   ];
//   print(newFriends);
// }

// 12

// void main() {
//   var player = {
//     'name': 'nico',
//     'xp': 19.99,
//     'superpower': false,
//   }; // object: any

//   Map<int, bool> players = {
//     1: true,
//     2: false,
//     3: true,
//   };

//   Map<List<int>, bool> player2 = {
//     [1, 2, 3, 4]: true,
//     [23, 45]: false,
//   };
// }

// 13

// void main() {
//   Set<int> numbers = {1, 2, 3, 4}; // all the elements are unique
//   numbers.add(1);
//   numbers.add(1);
//   numbers.add(1);
//   numbers.add(1);
//   print(numbers);
// }

// 14

// // void sayHello(String name) {
// //   print("hello $name nice to meet you!"); // void: doesn't return anything
// // }

// // String sayHello(String name) {
// //   return "hello $name nice to meet you!";
// // }

// String sayHello(String name) => "hello $name, nice to meet you!"; // when you use the function that has only return one line

// num plus(num a, num b) => a+b;
// void main() {
//   print(sayHello('nico'));
// }

// 15

// // String sayHello(String name, int age, String country){
// //   return "Hello $name, you are $age, and you come from $country."; // positional parameters -> should minimize this kind of code
// // }
// // void main() {
// //   print(sayHello('nico', 19, 'cuba'));
// // }

// // String sayHello({
// //   String name = 'anonymous',
// //   int age = 0,
// //   String country = 'wakanda',
// // }) {
// //   return "Hello $name, you are $age, and you come from $country.";
// // }

// String sayHello({
//   required String name,
//   required int age,
//   required String country,
// }) {
//   return "Hello $name, you are $age, and you come from $country.";
// }

// void main() {
//   print(sayHello(
//     name: 'nico',
//     age: 12,
//     country: 'cuba',
//   ));
// }

// 16

// String sayHello(String name, int age, [String ? country = 'cuba']) => // optional positional parameter
// 'Hello $name, you are $age years old from $country';

// void main() {
//   var results = sayHello('nico', 12);
//   print(results);
// }

// 17

// // QQ Operator

// // String capitalizeName(String name) => name.toUpperCase();
// // String capitalizeName(String? name) {
// //   if (name != null) {
// //     return name.toUpperCase();
// //   }
// //   return 'ANON';
// // }

// // String capitalizeName(String? name) =>
// //     name != null ? name.toUpperCase() : 'ANON';

// String capitalizeName(String? name) =>
//     name?.toUpperCase() ?? 'ANON'; // QQ Operator

// void main() {
//   capitalizeName('nico');
//   capitalizeName(null);
// }

// 18

// void main() {
//   String? name;
//   name ??= 'nico';
//   name = null;
//   name ??='another';
//   print(name);
// }

// 19

// typedef ListOfInts = List<int>;

// ListOfInts reverseListOfNumbers(ListOfInts list) {
//   var reversed = list.reversed;
//   return reversed.toList();
// }

// typedef UserInfo = Map<String, String>;

// String sayHi(Map<String, String> userInfo) {
//   return "Hi ${userInfo['name']}";
// }

// void main() {
//   print(reverseListOfNumbers([1,2,3]));
// }

// 20

// // class Player {
// //   String name = 'nico'; // class 내에서는 타입을 꼭 명시
// //   int xp = 1500;
// // }

// // void main() {
// //   var player = Player(); // 인스턴스 생성
// //   print(player.name);
// //   player.name = 'lalalal';
// //   print(player.name);
// //   }

// class Player {
//   final String name = 'nico';
//   int xp = 1500;

//   void sayHello() {
//     print("Hi my name is $name");
//   }
// }

// void main() {
//   var player = Player(); // 인스턴스 생성
//   player.sayHello();
//   }

// 21

// // class Player {
// //   late final String name;
// //   late int xp;

// //   Player(String name, int xp) {
// //     this.name = name;
// //     this.xp = xp;
// //   }
// //   void sayHello() {
// //     print("Hi my name is $name");
// //   }
// // }

// class Player {
//   final String name;
//   int xp;

//   Player(this.name, this.xp);

//   void sayHello() {
//     print("Hi my name is $name");
//   }
// }

// void main() {
//   var player = Player("nico", 1500); // 인스턴스 생성
//   player.sayHello();
//   var player2 = Player("lynn", 2500);
//   player2.sayHello();
// }

// 22

// class Player {
//   final String name;
//   int xp;
//   String team;
//   int age;

//   Player({
//     required this.name,
//     required this.xp,
//     required this.team,
//     required this.age,
//   });

//   void sayHello() {
//     print("Hi my name is $name");
//   }
// }

// void main() {
//   var player = Player(
//     name: "nico", // named constructor(생성자) paramiters
//     xp: 1500,
//     team: 'red',
//     age: 12,
//   );
//   player.sayHello();
//   var player2 = Player(
//     name: "lynn",
//     xp: 2500,
//     team: 'blue',
//     age: 12,
//   );
//   player2.sayHello();
// }

// 23


// // constructor 개념 이해하기 
// class Player {
//   final String name;
//   int xp, age;
//   String team;

//   Player({
//     required this.name,
//     required this.xp,
//     required this.team,
//     required this.age,
//   });

//   Player.createBluePlayer({ // named constructor
//     required String name,
//     required int age,
//   })  : this.age = age, // player 객체 초기화
//         this.name = name,
//         this.team = 'blue',
//         this.xp = 0;

//   Player.createRedPlayer(String name, int age)
//       : this.age = age,
//         this.name = name,
//         this.team = 'red',
//         this.xp = 0;

//   void sayHello() {
//     print("Hi my name is $name");
//   }
// }

// void main() {
//   var player = Player.createBluePlayer(
//     name: "nico",
//     age: 12,
//   );
//   player.sayHello();
//   var player2 = Player.createRedPlayer("nico", 21);
//   player2.sayHello();
// }


// 24

class Player {
  final String name;
  int xp;
  String team;


// player class 초기화  // name of the constructor
Player.fromJson(Map<String, dynamic> playerJson) :  
  name = playerJson['name'],
  xp = playerJson['xp'],
  team = playerJson['team'];

void main() {
  var apiData = [
    {
      "name" : "nico",
      "team" : "red",
      "xp" : 0,
    },
        {
      "name" : "lynn",
      "team" : "red",
      "xp" : 0,
    },
        {
      "name" : "dal",
      "team" : "red",
      "xp" : 0,
    }
  ]
}