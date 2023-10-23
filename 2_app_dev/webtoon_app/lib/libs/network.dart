import 'package:http/http.dart' as http;
import 'dart:convert';

String apiKey =
    'sQZC66p8CL9zs98TPzjp0GROuTiUQ%2FX44COIIqbLWINzN06L5bb9m2xDnDP3UDseehWtZlFlT3UJZVlPoLpGZA%3D%3D';
Network network = Network(
    'http://apis.data.go.kr/B551011/KorService1/locationBasedList1?serviceKey=$apiKey&numOfRows=10&pageNo=1&base_date=20220105&base_time=0600&nx=55&ny=127&dataType=JSON');

class Network {
  final String weatherUrl;
  Network(this.weatherUrl);

  Future<dynamic> getWeatherData() async {
    http.Response response = await http.get(Uri.parse(weatherUrl));
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData); //json형식 문자열을 배열 또는 객체로 변환하는 함수
      return parsingData;
    }
  }
}
