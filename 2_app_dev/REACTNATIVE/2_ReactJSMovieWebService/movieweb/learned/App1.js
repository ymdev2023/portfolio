import { useState, useEffect} from "react";

function App() {
  const [counter, setValue] = useState(0);
  const [keyword, setKeyword] = useState("")
  const onClick = () => setValue((prev) => prev + 1)
  const onChange = (event) => setKeyword(event.target.value);


  // useEffect : state를 변화시킬 때 재실행

  // console.log('I run all the time.');

  // const iRunOnlyOnce = () => {
  //   console.log("I run only once.");
  // };
  // useEffect(iRunOnlyOnce, []);

  useEffect(() => {
    console.log("CALL THE API..."); // run only once and never run again
  }, []);
  useEffect(() => {
    if (keyword !== "" && keyword.length > 5) {
      console.log("SEARCH FOR", keyword);
    }
  }, [keyword]); // run when the keyword changes
  useEffect(() => {
    console.log("I run when 'counter'changes");
  }, [counter]); 

  return (
    <div>
      <input 
      value={keyword}
      onChange={onChange} 
      type="text" 
      placeholder="Search here..." 
      />
      <h1>{counter}</h1>
      <button onClick={onClick}>click me</button>
    </div>
  );
}

export default App;
