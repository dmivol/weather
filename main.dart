import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import './models/weather.dart';

//todo Вернуть из getWeatherByCity экземпляр модели Weather либо ошибку
// Обработать ошибку 404 и вернуть ошибку или исключение с - неправильный url-запрос,
// ошибка - что-то пошло не так
// создать метод showtoconsol - превращаем поля модели в строки (спецсимволы для
// сброса строки, смайлы и т.д.), добавить условие - хочешь ли ты завершить программу?
void main() async {
  getWeather();
}

Future<void> getWeather() async {
  for (var i = 0; i < 3; i++) {
    final city = await getInput();
    print('Ваш город - это $city');
    if (city.isNotEmpty) {
      try {
        final weather = await getWeatherByCity(city);
      }catch (e) {
        print(e);
      }

    }
  }
}

Future<String> getInput() async {
  print('Введите название города:');
  return stdin.readLineSync();
}

Future<Weather> getWeatherByCity(String city) async {
        var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=459f6c565802e5a2171df04458b9a193');
    var response = await http.get(url);
    print(response.statusCode);

  //print(response.body);

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
    return weather;
  } else if (response.statusCode == 404) {
    throw Exception('Request failed with status: ${response.statusCode}.');
  } else if (response.statusCode == 401) {
    throw Exception('Unauthorized: ${response.statusCode}.');
  }
}
