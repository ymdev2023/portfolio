import { useState } from "react";

function App() {
  const [toDo, setToDo] = useState(""); // state를 직접적으로 수정하지 않으므로, toDo="" 이렇게 쓰지 않음
  const [toDos, setToDos] = useState([]);
  const onChange = (event) => setToDo(event.target.value);
  const onSubmit = (event) => {
    event.preventDefault(); // default: refresh
    if (toDo === "") {
      return; // kill the function
    }
    setToDos((currentArray) => [toDo, ...currentArray]); // array에 새로운 요소 추가
    setToDo(""); // empty the input
  };
  console.log(toDos);
  return (
    <div>
      <h1>My ToDos ({toDos.length})</h1>
      <form onSubmit={onSubmit}>
        <input
          onChange={onChange}
          value={toDo}
          type="text"
          placeholder="Write your todos..."
        />
        <button>Add To Do</button>
      </form>
      <hr />
      <ul>
        {toDos.map((item, index) => (
          <li key={index}>{item}</li>
        ))}
      </ul>
    </div>
  );
}

export default App;
