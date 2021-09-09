import 'dart:io';
import 'package:http/http.dart';

void main(List<String> arguments) async {
  for (var i = 0; i < 3; i++) {
    final result = await getInput();
    print ('Ваш город - это $result');
    if (result.isEmpty) {
      print('Вы не вввели название города');
    }
  }
}

Future<String> getInput() async {
  print('Введите название города:');
  return stdin.readLineSync();
}
