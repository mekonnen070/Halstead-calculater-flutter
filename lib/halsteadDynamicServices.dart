import 'dart:convert';

import 'package:dio/dio.dart';
const String path = 'https://halsted-calculator.herokuapp.com/api';

class HalsteadCalculatorServices {
  Dio dio = Dio();

  dynamicallyPoster(var code) async {
    Response response = await dio.post(path, data: {'code': code});
    return response;
  }
}
