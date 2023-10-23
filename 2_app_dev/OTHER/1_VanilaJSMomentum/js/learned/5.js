// 5. CLOCK

// 5-0. Intervals(clock.js)

// const clock = document.querySelector("h2#clock");

// function sayHello() {
//   console.log("hello");
// }

// setInterval(sayHello, 5000);

// 5-1. Timeouts and Dates

// // Date 객체는 getDay(), getFullYear(), getMinutes(), getHours(), getSeconds() 등의 많은 프로퍼티를 갖고있음

// const clock = document.querySelector("h2#clock");

// function getClock() {
//   const date = new Date();
//   clock.innerText = `${date.getHours()}:${date.getMinutes()}:${date.getSeconds()}`;
// }

// getClock();
// setInterval(getClock, 1000); // 1초 기다렸다가 실행!

// 5-2. PadStart

// // PadStart는 string의 길이를 조절하는 객체, 앞부분에 특정 문자 추가(PadEnd와 다름)

// const clock = document.querySelector("h2#clock");

// function getClock() {
//   const date = new Date();
//   const hours = String(date.getHours()).padStart(2, "0");
//   const minutes = String(date.getMinutes()).padStart(2, "0");
//   const seconds = String(date.getSeconds()).padStart(2, "0");
//   clock.innerText = `${hours}:${minutes}:${seconds}`;
// }

// getClock();
// setInterval(getClock, 1000);

// 5-3. Recap

// 위와 동일