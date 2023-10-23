// 3. JAVASCRIPT ON THE BROWSER

// 3-0. The Document Object

// console에 document를 치면 HTML 객체를 불러올 수 있음 >> document.title 치면 "Momentum"이라고 출력함
// >>> HTML 코드를 자바스크립트 관점에서 보는것!
// 만약 console상에서 document.title = "Hi" 라고 치면 그 페이지 안에서는 타이틀 변경할 수 있음
// 만약 HTML 상의 제목이 "Hello from HTML!"이고 app.js에 document.title = "Hello from JS!"로 해놓으면 최종 타이틀은 후자가 됨

// 3-1. HTML in Javascript

// console에서 document.getElementById("title")
// const title = document.getElementById("title");
// console.dir(title); // element 자세하게 보여주기
// title.innerText = "Got you!";
// console.log(title.id);
// console.log(title.className);

// 3-2. Searching For Elements

{
    /* <h1 class = "hello">Grab me!</h1>
  <h1 class = "hello">Grab me!</h1>
  <h1 class = "hello">Grab me!</h1>
  <h1 class = "hello">Grab me!</h1>
  <h1 class = "hello">Grab me!</h1>
  <h1 class = "hello">Grab me!</h1> */
  }
  
  // const hellos = document.getElementsByClassName("hello");
  // console.log(hellos);
  
  // const title = document.getElementsByTagName("h1");
  // console.log(title);
  
  // const title1 = document.querySelector(".hello h1"); // css selector 이용, 첫 번째 element만 가져옴
  // console.log(title1);
  
  // const title2 = document.querySelectorAll(".hello h1"); // array로 반환
  // console.log(title2);

  // 3-3. Events

// const title = document.querySelector(".hello:first-child h1");
// console.log(title);
// console.dir(title);
// title.innerText = "Hello";

// function handleTitleClick() {
//   title.style.color = "blue";
//   console.log("Title was clicked!");
// }

// title.addEventListener("click", handleTitleClick); // 유저 행동을 지켜보다가 title을 click 하면 특정 함수 실행

// 3-4. Events part Two

// 구글에 html element 검색해보는법: h1 html element MDN(Mozilla Developer Network) >>> Web APIS라는 단어 포함된 페이지 찾기(JS 관련)
// console.dir(title)로 찾아보고, on이 붙은 애들은 event 관련이라고 생각하면 됨

// const title = document.querySelector(".hello:first-child h1");
// console.dir(title);

// function handleTitleClick() {
//   title.style.color = "blue";
// }

// function handleMouseEnter() {
//   title.innerText = "Mouse is here!";
// }

// function handleMouseLeave() {
//   title.innerText = "Mouse is gone!";
// }

// title.addEventListener("click", handleTitleClick);
// title.addEventListener("mouseenter", handleMouseEnter);
// title.addEventListener("mouseleave", handleMouseLeave);

// 3-5. More Events

// const h1 = document.querySelector(".hello:first-child h1");

// function handleTitleClick() {
//   h1.style.color = "blue";
// }

// function handleMouseEnter() {
//   h1.innerText = "Mouse is here!";
// }

// function handleMouseLeave() {
//   h1.innerText = "Mouse is gone!";
// }

// function handleWindowResize() {
//   document.body.style.backgroundColor = "tomato"; // 윈도우 크기 변경 시 배경을 토마토색으로 바꿈
// }

// function handleWindowCopy() {
//   // 복사 시도 시 알람 띄움
//   alert("copier!");
// }

// function handleWindowOffline() {
//   alert("SOS no WIFI!");
// }

// function handleWindowOnline() {
//   alert("ALL GOOOD!");
// }

// h1.addEventListener("click", handleTitleClick); // title.onclick = handleTitleClick;
// h1.addEventListener("mouseenter", handleMouseEnter);
// h1.addEventListener("mouseleave", handleMouseLeave); // title.onmouseenter = handleMouseEnter;

// window.addEventListener("resize", handleWindowResize);
// window.addEventListener("copy", handleWindowCopy);
// window.addEventListener("offline", handleWindowOffline);
// window.addEventListener("online", handleWindowOnline);

// 3-6. CSS in Javascript

// const h1 = document.querySelector(".hello:first-child h1");

// function handleTitleClick() {
//   const currentColor = h1.style.color;
//   let newColor;
//   if (currentColor === "blue") {
//     newColor = "tomato";
//   } else {
//     newColor = "blue";
//   }
//   h1.style.color = newColor;
// }

// h1.addEventListener("click", handleTitleClick);

// 3-7. CSS in Javascript part Two

// const h1 = document.querySelector(".hello:first-child h1");

// function handleTitleClick() {
//     const clickedClass = "clicked"; // raw value를 미리 변수로 정의하고 시작
//   if (h1.className === clickedClass) {
//     h1.className = "";
//   } else {
//     h1.className = clickedClass; 
//   }
// }

// h1.addEventListener("click", handleTitleClick);

// 3-8. CSS in Javascript part Three

// const h1 = document.querySelector(".hello:first-child h1");

// function handleTitleClick() {
//   h1.classList.toggle("clicked"); // 밑의 코드와 같은 기능, clicked가 className에 있는지 확인 후 remove & add

//   //   const clickedClass = "clicked";
//   //   if (h1.classList.contains(clickedClass)) {
//   //     // className과 달리 classList는 replace를 하지 않고 조작 가능 >>> html의 sexy-font 확인!
//   //     h1.classList.remove(clickedClass);
//   //   } else {
//   //     h1.classList.add(clickedClass);
//   //   }
// }

// h1.addEventListener("click", handleTitleClick);
