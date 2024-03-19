import 'package:dio/dio.dart';
import 'package:movie_rocket/utils/configs.dart';

class BaseApi {
  // var x = Config.setUp();
  final dio = Dio(BaseOptions(baseUrl: Config.baseApiUrl));

  setHeaders() async {
    String? token = Config.token;
    dio.options.headers["Authorization"] = "Bearer $token";
  }
}
