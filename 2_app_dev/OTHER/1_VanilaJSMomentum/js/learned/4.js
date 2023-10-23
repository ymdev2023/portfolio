// 4. LOGIN

// 4-0. Input Values

// // const loginForm = document.getElementById("login-form");
// // const loginInput = loginForm.querySelector("input");
// // const loginButton = loginForm.querySelector("Button");

// const loginInput = document.querySelector("#login-form input");
// const loginButton = document.querySelector("#login-form Button");

// function onLoginBtnClick() {
//   console.dir(loginInput);
//   console.log("Hello, ", loginInput.value);
// }
// loginButton.addEventListener("click", onLoginBtnClick);

// 4-1. Form Submission

// const loginInput = document.querySelector("#login-form input");
// const loginButton = document.querySelector("#login-form Button");

// // function onLoginBtnClick() {
// //   const username = loginInput.value;
// //   if (username === "") {
// //     alert("Please write your name.");
// //   } else if(username.length > 15) {
// //     alert("Your name is too long.")
// //   }
// // }
// function onLoginBtnClick() {
//   const username = loginInput.value; // html에서 div대신 form 으로 input 감쌈 
//   console.log(username);
// }
// loginButton.addEventListener("click", onLoginBtnClick);

// 4-2. Events

// const loginForm = document.querySelector("#login-form");
// const loginInput = document.querySelector("#login-form input");
// const loginButton = document.querySelector("#login-form Button");

// function onLoginSubmit(event) {
//   event.preventDefault(); // event의 default behavior을 방지(form은 submit시 전체 페이지 새로고침하므로)
//   console.log(loginInput.value);
// }

// loginForm.addEventListener("submit", onLoginSubmit); // form 은 엔터하든 클릭하든 submit할 수 있음

// 4-3. Events part Two

// const loginForm = document.querySelector("#login-form");
// const loginInput = document.querySelector("#login-form input");
// const link = document.querySelector("a");

// function onLoginSubmit(event) {
//   event.preventDefault();
//   console.log(loginInput.value);
// }

// function handleLinkClick(event) {
//   event.preventDefault();
//   console.dir(event); // 이벤트로 인해 생긴 여러 정보 전달
//   alert("clicked!");
// }
// loginForm.addEventListener("submit", onLoginSubmit);
// link.addEventListener("click", handleLinkClick);

// 4-4. Getting Username

// const loginForm = document.querySelector("#login-form");
// const loginInput = document.querySelector("#login-form input");
// const greeting = document.querySelector("#greeting");

// const HIDDEN_CLASSNAME = "hidden"; // string에는 대문자로만 구성하는것이 관습
// function onLoginSubmit(event) {
//   event.preventDefault();
//   loginForm.classList.add("hidden");
//   const username = loginInput.value;
//   greeting.innerText = `Hello, ${username}`;
//   greeting.classList.remove(HIDDEN_CLASSNAME);
// }

// loginForm.addEventListener("submit", onLoginSubmit);

// 4-5. Saving Username

// // console에 localStorage라고 치면 값이 나오고, Application 탭으로 가면 local storage를 확인할 수 있다.
// // localStorage.setItem("username", "nico") >>> database에 key, value값으로 저장됨(miniDB와 같은 기능)
// // localStorage.getItem("username") / localStorage.removeItem("username") 

// const loginForm = document.querySelector("#login-form");
// const loginInput = document.querySelector("#login-form input");
// const greeting = document.querySelector("#greeting");

// const HIDDEN_CLASSNAME = "hidden"; // string에는 대문자로만 구성하는것이 관습
// function onLoginSubmit(event) {
//   event.preventDefault();
//   loginForm.classList.add("hidden");
//   const username = loginInput.value;
//   localStorage.setItem("username", username);
//   greeting.innerText = `Hello, ${username}`;
//   greeting.classList.remove(HIDDEN_CLASSNAME);
// }

// loginForm.addEventListener("submit", onLoginSubmit);

// 4-6. Loading Username

// const loginForm = document.querySelector("#login-form");
// const loginInput = document.querySelector("#login-form input");
// const greeting = document.querySelector("#greeting");

// const HIDDEN_CLASSNAME = "hidden";
// const USERNAME_KEY = "username";

// function onLoginSubmit(event) {
//   event.preventDefault();
//   loginForm.classList.add(HIDDEN_CLASSNAME);
//   const username = loginInput.value;
//   localStorage.setItem(USERNAME_KEY, username);
//   paintGreetings(username);
// }

// function paintGreetings(username) {
//   greeting.innerText = `Hello, ${username}`;
//   greeting.classList.remove(HIDDEN_CLASSNAME);
// }

// const savedUsername = localStorage.getItem(USERNAME_KEY);

// if (savedUsername === null) {
//   loginForm.classList.remove(HIDDEN_CLASSNAME);
//   loginForm.addEventListener("submit", onLoginSubmit);
// } else {
//   paintGreetings(savedUsername);
// }

// 4-7. Super Recap

// const loginForm = document.querySelector("#login-form");
// const loginInput = document.querySelector("#login-form input");
// const greeting = document.querySelector("#greeting");

// const HIDDEN_CLASSNAME = "hidden";
// const USERNAME_KEY = "username";

// function onLoginSubmit(event) {
//   event.preventDefault();
//   loginForm.classList.add(HIDDEN_CLASSNAME);
//   const username = loginInput.value;
//   localStorage.setItem(USERNAME_KEY, username);
//   paintGreetings();
// }

// function paintGreetings() {
//   const username = localStorage.getItem(USERNAME_KEY);
//   greeting.innerText = `Hello, ${username}`;
//   greeting.classList.remove(HIDDEN_CLASSNAME);
// }

// const savedUsername = localStorage.getItem(USERNAME_KEY);

// if (savedUsername === null) {
//   loginForm.classList.remove(HIDDEN_CLASSNAME);
//   loginForm.addEventListener("submit", onLoginSubmit);
// } else {
//   paintGreetings();
// }