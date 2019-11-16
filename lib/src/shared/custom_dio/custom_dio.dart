import 'package:dio/dio.dart';
import 'package:redditnews/src/shared/constants.dart';
import 'package:redditnews/src/shared/custom_dio/interceptors.dart';

class CustomDio extends Dio {

  CustomDio() {
    options.baseUrl= BASE_URL;
    interceptors.add(CustomInterceptors());
    options.connectTimeout = 5000;
  }
}