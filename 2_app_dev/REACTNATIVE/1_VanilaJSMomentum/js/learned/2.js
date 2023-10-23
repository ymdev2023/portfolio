// 2. WELCOME TO JAVASCRIPT

// 2-6. Objects

// BAD

// const playerName = "nico";
// const playerPoints = 121212;
// const playerHandsome = false;
// const playerFat = "little bit";

// GOOD

// const player = {
//   name: "nico",
//   points: 10,
//   fat: true,
// };

// console.log(player);
// player.fat = false;
// console.log(player.name);
// player.lastName = "potato";
// player.points = player.points + 15;
// console.log(player["name"]);

// 2-7. Functions part one

// 반복을 줄이기 위해 코드를 캡슐화해서 재사용 가능하게 함
// ()는 press play와 같은 기능
// argument: 인자, 정보를 함수로 보냄

// function sayHello(){
//     console.log("hello!");
// } 

// sayHello();

// 2-8. Functions part two

// function sayHello(nameOfPerson, age) {
//     console.log("Hello my name is " + nameOfPerson + " and I am " + age);
//   }
  
//   sayHello("nico", 10);
//   sayHello("dal", 23);
//   sayHello("lynn", 21);
  
//   function plus(a,b) {
//       console.log(a + b);
//   }
  
//   function divide(a,b) {
//       console.log(a / b);
//   }
  
//   plus(8, 60);
//   divide(98, 20);
  
//   // NaN: Not a Number
  
//   const player = {
//       name: "nico",
//       sayHello: function(otherPersonsName) {
//           console.log("Hello! " + otherPersonsName + " Nice to meet you.");
//       }
//   };
  
//   console.log(player.name);
//   player.sayHello("Lynn");

  // 2-9. Recap

// // var은 예전거니까 사용하지 말것! let과 const의 기능 경계가 희미
// const a = 5;
// let isNicoFat = true; // const와 다르게 업데이트 가능
// isNicoFat = false;

// // null: '비어있음' 상태를 값으로 가짐 vs. undefined: 값을 갖지 않음

// const toBuy = ["potato", "tomato", "pizza"];

// console.log(toBuy[2]);
// toBuy[2] = "water";
// console.log(toBuy);
// toBuy.push("meat"); // 아이템 추가
// console.log(toBuy);

// 2-10. Recap 2

// const player = {
//     name: "Nico", // 프로퍼티
//     age: 98,
//   };
  
//   console.log(player, console); // console 자체도 object이다!
//   player.name = "Nicolas";
//   console.log(player);
//   player.sexy = "soon";
//   console.log(player);
  
//   function plus(potato, salad) {
//     // a와 b는 placeholder(자리 표시자)일 뿐!
//     console.log(potato + salad);
//   }
  
//   plus(5, 10);
  
//   function minusFive(potato) {
//     // a와 b는 placeholder(자리 표시자)일 뿐!
//     console.log(potato - 5);
//   }
  
//   minusFive(5, 10, 12, 34, 4, 5, 6, 7); // 인자가 원래 주어진 것보다 많은 경우 처음 인자만 받는다

// 2-11. Returns

//  const age = 96;

//  function calculateKrAge(ageOfForeigner){
//     ageOfForeigner + 2; // 반환 안함
//     return "hello"; // 결과를 반환한다
//  }

//  function calculateKrAge(ageOfForeigner){
//     return ageOfForeigner + 2; // 결과를 반환한다(replacing)
//  }

//  const krAge = calculateKrAge(age);

//  console.log(krAge);

// 2-12. Recap

// const calculator = {
//   plus: function (a, b) {
//     console.log(a+b); // 나중에 함수에서 아무 값으로도 리턴되지 않음
//     return a + b;
//     console.log("hello!"); // return 시 코드는 그냥 끝나버림 >> 작동하지 않음
//   },
//   minus: function (a, b) {
//     return a - b;
//   },
//   times: function (a, b) {
//     return a * b;
//   },
//   divide: function (a, b) {
//     return a / b;
//   },
//   powerof: function (a, b) {
//     return a ** b;
//   },
// };

// const plusResult = calculator.plus(2, 3);
// const minusResult = calculator.minus(plusResult, 10);
// const timesResult = calculator.times(10, minusResult); // 변수가 서로 상호의존적
// const divideResult = calculator.divide(timesResult, plusResult);
// const powerResult = calculator.powerof(divideResult, minusResult);

// 2-13. Conditionals

// const age = prompt("How old are you?"); // 잠깐 멈추고 답을 기다림 : 팝업 제한 기능과 디자인 면에서 한계가 있음

// console.log(age);
// console.log(typeof age); // string: Default

// console.log(age, parseInt(age));

//

// const age = parseInt(prompt("How old are you?")); // 내부에서부터 외부로 실행
// console.log(age);

// 2-14. Conditionals Part Two

// const age = parseInt(prompt("How old are you?")); // 내부에서부터 외부로 실행

// if(isNaN(age)){
//     console.log("Please write a number.");
// } else {
//     console.log("Thank you for writing your age.")
// };

// 2-15. Conditionals Part Three

// const age = parseInt(prompt("How old are you?")); // 내부에서부터 외부로 실행

// if (isNaN(age) || age < 0) {
//   console.log("Please write a real positive number.");
// } else if (age < 18) {
//   console.log("You are too young to drink.");
// } else if (age >= 18 && age <= 50) {
//   console.log("You can drink.");
// } else if (age > 50 && age <= 80) {
//   console.log("You should exercise. ");
// } else if (age > 80) {
//   console.log("You can do whatever you want.");
// }

// 2-16. Recap

// const age = parseInt(prompt("How old are you?")); // 내부에서부터 외부로 실행

// if (isNaN(age) || age < 0) {
//   console.log("Please write a real positive number.");
// } else if (age < 18) {
//   console.log("You are too young to drink.");
// } else if (age >= 18 && age <= 50) {
//   console.log("You can drink.");
// } else if (age > 50 && age <= 80) {
//   console.log("You should exercise. ");
// } else if (age === 100) {
//   console.log("Wow, you are wise.");
// } else if (age > 80) {
//   console.log("You can do whatever you want.");
// }

// if ((a && b) || (c && d) || x || w) {
// }
