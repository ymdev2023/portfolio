// 7. TO DO LIST

// 7-0. Setup
 
// const toDoForm = document.getElementById("todo-form");
// const toDoInput = toDoForm.querySelector("input");
// const toDoList = document.getElementById("todo-list");

// function handleToDoSubmit(event){
//    event.preventDefault();
//    const newTodo = toDoInput.value; // newTodo에 값 복사
//    // console.log(toDoInput.value);
//    toDoInput.value ="";
//    // console.log(newTodo, toDoInput.value);
// }

// toDoForm.addEventListener("submit", handleToDoSubmit)

// 7-1. Adding To-Dos

// const toDoForm = document.getElementById("todo-form");
// const toDoInput = toDoForm.querySelector("input");
// const toDoList = document.getElementById("todo-list");

// function paintToDo(newTodo) {
//   const li = document.createElement("li");
//   const span = document.createElement("span");
//   li.appendChild(span);
//   span.innerText = newTodo;
//   toDoList.appendChild(li);
// }
// function handleToDoSubmit(event) {
//   event.preventDefault();
//   const newTodo = toDoInput.value; // newTodo에 값 복사
//   toDoInput.value = "";
//   paintToDo(newTodo);
// }

// toDoForm.addEventListener("submit", handleToDoSubmit);

// 7-2. Deleting To-Dos

// const toDoForm = document.getElementById("todo-form");
// const toDoInput = toDoForm.querySelector("input");
// const toDoList = document.getElementById("todo-list");

// function deleteToDo(event) {
//   const li = event.target.parentElement;
//   li.remove();
// }
// function paintToDo(newTodo) {
//   const li = document.createElement("li");
//   const span = document.createElement("span");
//   span.innerText = newTodo;
//   const button = document.createElement("button");
//   button.innerText = "❌";
//   button.addEventListener("click", deleteToDo);
//   li.appendChild(span);
//   li.appendChild(button);
//   toDoList.appendChild(li);
// }
// function handleToDoSubmit(event) {
//   event.preventDefault();
//   const newTodo = toDoInput.value; // newTodo에 값 복사
//   toDoInput.value = "";
//   paintToDo(newTodo);
// }

// toDoForm.addEventListener("submit", handleToDoSubmit);

// 7-3. Saving To-Dos

// const toDoForm = document.getElementById("todo-form");
// const toDoInput = toDoForm.querySelector("input");
// const toDoList = document.getElementById("todo-list");

// const toDos = [];

// function saveToDos(){
//     localStorage.setItem("todo", JSON.stringify(toDos)) 
// }

// function deleteToDo(event) {
//   const li = event.target.parentElement;
//   li.remove();
// }
// function paintToDo(newTodo) {
//   const li = document.createElement("li");
//   const span = document.createElement("span");
//   span.innerText = newTodo;
//   const button = document.createElement("button");
//   button.innerText = "❌";
//   button.addEventListener("click", deleteToDo);
//   li.appendChild(span);
//   li.appendChild(button);
//   toDoList.appendChild(li);
// }
// function handleToDoSubmit(event) {
//   event.preventDefault();
//   const newTodo = toDoInput.value; // newTodo에 값 복사
//   toDoInput.value = "";
//   toDos.push(newTodo);
//   paintToDo(newTodo);
//   saveToDos();
// }

// toDoForm.addEventListener("submit", handleToDoSubmit);


// 7-4. Loading To-Dos part One
// 7-5. Loading To-Dos part Two
// 7-6. Deleting To-Dos part One

// const toDoForm = document.getElementById("todo-form");
// const toDoInput = toDoForm.querySelector("input");
// const toDoList = document.getElementById("todo-list");

// const TODOS_KEY = "todos";
// let toDos = [];

// function saveToDos() {
//   localStorage.setItem(TODOS_KEY, JSON.stringify(toDos));
// }

// function deleteToDo(event) {
//   const li = event.target.parentElement;
//   li.remove();
// }
// function paintToDo(newTodo) {
//   const li = document.createElement("li");
//   li.id = newTodo.id;
//   const span = document.createElement("span");
//   span.innerText = newTodo.text;
//   const button = document.createElement("button");
//   button.innerText = "❌";
//   button.addEventListener("click", deleteToDo);
//   li.appendChild(span);
//   li.appendChild(button);
//   toDoList.appendChild(li);
// }
// function handleToDoSubmit(event) {
//   event.preventDefault();
//   const newTodo = toDoInput.value; // newTodo에 값 복사
//   toDoInput.value = "";
//   const newTodoObj = {
//     text: newTodo,
//     id: Date.now()
//   }
//   toDos.push(newTodoObj);
//   paintToDo(newTodoObj);
//   saveToDos();
// }

// toDoForm.addEventListener("submit", handleToDoSubmit);

// const savedToDos = localStorage.getItem(TODOS_KEY);
// console.log(savedToDos);
// if (savedToDos !== null) {
//   const parsedToDos = JSON.parse(savedToDos);
//   toDos = parsedToDos;
// //   console.log(parsedToDos);
//   parsedToDos.forEach(paintToDo);
// }

// 7-7. Deleting To-Dos part Two
// 7-8. Deleting To-Dos part Three

// const toDoForm = document.getElementById("todo-form");
// const toDoInput = toDoForm.querySelector("input");
// const toDoList = document.getElementById("todo-list");

// const TODOS_KEY = "todos";
// let toDos = [];

// function saveToDos() {
//   localStorage.setItem(TODOS_KEY, JSON.stringify(toDos));
// }

// function deleteToDo(event) {
//   const li = event.target.parentElement;
//   li.remove();
//   console.log(typeof li.id);
//   toDos = toDos.filter((toDo) => toDo.id !== parseInt(li.id));
//   saveToDos();
// }
// function paintToDo(newTodo) {
//   const li = document.createElement("li");
//   li.id = newTodo.id;
//   const span = document.createElement("span");
//   span.innerText = newTodo.text;
//   const button = document.createElement("button");
//   button.innerText = "❌";
//   button.addEventListener("click", deleteToDo);
//   li.appendChild(span);
//   li.appendChild(button);
//   toDoList.appendChild(li);
// }
// function handleToDoSubmit(event) {
//   event.preventDefault();
//   const newTodo = toDoInput.value; // newTodo에 값 복사
//   toDoInput.value = "";
//   const newTodoObj = {
//     text: newTodo,
//     id: Date.now(),
//   };
//   toDos.push(newTodoObj);
//   paintToDo(newTodoObj);
//   saveToDos();
// }

// toDoForm.addEventListener("submit", handleToDoSubmit);

// const savedToDos = localStorage.getItem(TODOS_KEY);
// console.log(savedToDos);
// if (savedToDos !== null) {
//   const parsedToDos = JSON.parse(savedToDos);
//   toDos = parsedToDos;
//   //   console.log(parsedToDos);
//   parsedToDos.forEach(paintToDo);
// }

