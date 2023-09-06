import { useState, useEffect} from "react";

// component: jsx를 return 하는 function
function Hello() {

  // function byeFn(){
  //   console.log("Destroyed!"); // Cleanup function
  // }
  // function hiFn(){
  //   console.log("Created!");
  //   return byeFn;
  // }
  
  // useEffect(hiFn, []);
  
  useEffect(() => {
    console.log("hi");
    return () => console.log("bye");
  });

  return <h1>Hello</h1>;
}
function App() {
  const [showing, setShowing] = useState(false);
  const onClick = () => setShowing((prev) => !prev);
  return (
    <div>
      {showing ? <Hello /> : null}
      <button onClick={onClick}>{showing ? "Hide" : "Show"}</button>
    </div>
  );
}

export default App;
