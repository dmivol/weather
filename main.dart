import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import './models/weather.dart';
// todo В функции weather сделать возможность передачи функции города
// todo remove Function.dart from project
// todo weather file from project

void main()async{
  // for (var i = 0; i < 1; i++) {
  //   final result = await getInput();
  //   print('Ваш город - это $result');
  //   if (result.isEmpty) {
  //     print('Вы не вввели название города');
  //   }
  // }
  getWeather('Kiev');
}

Future<String> getInput() async {
  print('Введите название города:');
  return stdin.readLineSync();
  }
Future<String> getWeather(String city) async{
  var url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=459f6c565802e5a2171df04458b9a193');
  var response = await http.get(url);
  print(response.statusCode);
  print(response.body);

  if (response.statusCode == 200) {
    var jsonResponse =
    convert.jsonDecode(response.body) as Map<String, dynamic>;
   var weather = Weather.fromJson(jsonResponse);
   print(weather);
   print(weather.lon);
   print(weather.lat);
   print(weather.humidity);
   print(weather.country);
   print(weather.speed);
   print(weather.description);
   print(weather.all);



  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}
