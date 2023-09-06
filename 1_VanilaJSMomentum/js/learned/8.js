// 8. WEATHER
// 8-0. Geolocation

// function onGeoOk(position) {
//     const lat = position.coords.latitude;
//     const lng = position.coords.longitude;
//   console.log("you live in", lat, lng);
// }
// function onGeoError() {
//   alert("Can't find you. No weather for you.");
// }
// navigator.geolocation.getCurrentPosition(onGeoOk, onGeoError);

// 8-1. Weather API

// const API_KEY = "814c35d7b6275a514b826fe9e02d8ba5";
// function onGeoOk(position) {
//   const lat = position.coords.latitude;
//   const lon = position.coords.longitude;
//   console.log("you live in", lat, lon);
//   const url = `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric`;
//   fetch(url)
//   .then(response => response.json())
//   .then(data => {
//     const weather = document.querySelector("#weather span:first-child");
//     const city = document.querySelector("#weather span:last-child");
//     city.innerText = data.name;
//     weather.innerText = `${data.weather[0].main} / ${data.main.temp}`;
//    }); // url 가져온 후 response 받아라
// }
// function onGeoError() {
//   alert("Can't find you. No weather for you.");
// }
// navigator.geolocation.getCurrentPosition(onGeoOk, onGeoError);