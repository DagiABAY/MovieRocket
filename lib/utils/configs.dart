import 'dart:convert';
import 'package:flutter/services.dart';

class Config {
  Config();
  static String baseApiUrl="https://api.themoviedb.org/3";
  static String? apiKey;
  static String? baseImageApiUrl="https://image.tmdb.org/t/p/w500";
  static String token="eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0NjExOThmNDlmNDdlMDI2YTM4NGIzY2UwYjcyZDFiNCIsInN1YiI6IjY1ZjI5Nzk2ZWVhMzRkMDE4ODE1ZjI5NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ._llMvlHCJtfaBKmgDNdbVk7mgDn82Ur17psq53oYClw";
  // static setUp() async {
  //   final configFile = await rootBundle.loadString("assets/configs/main.json");
  //   final configData = jsonDecode(configFile);
  //   apiKey = configData['API_KEY'];
  //   print("keyyyyyyyyyyyyyyyy$apiKey");
  //   baseApiUrl = configData['BASE_API_URL'];
  //   baseImageApiUrl = configData['BASE_IMAGE_API_URL'];
  //   token = configData['token'];
  // }


}
