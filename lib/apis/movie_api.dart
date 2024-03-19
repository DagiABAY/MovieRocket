import 'package:dio/dio.dart';
import 'package:movie_rocket/apis/base_api.dart';

class MovieApi extends BaseApi {
  getTopRated({int? page}) async {
    try {
      await setHeaders();
      Map<String, dynamic> query = {"language": 'en-US', "page": page};
      var res = await dio.get("/movie/top_rated", queryParameters: query);
      if (res.statusCode == 200) {
        return res.data["results"];
      } else {
        return null;
      }
    } on DioException catch (e) {
      print(e);
    }
  }

  getPopularMovies({int? page}) async {
    try {
      await setHeaders();
      Map<String, dynamic> query = {"language": 'en-US', "page": page};
      var res = await dio.get("/movie/popular", queryParameters: query);
      if (res.statusCode == 200) {
        return res.data["results"];
      } else {
        return null;
      }
    } on DioException catch (e) {
      print(e);
    }
  }

  getUpcomingMovies({int? page}) async {
    try {
      await setHeaders();
      Map<String, dynamic> query = {"language": 'en-US', "page": page};
      var res = await dio.get("/movie/upcoming", queryParameters: query);
      if (res.statusCode == 200) {
        return res.data["results"];
      } else {
        return null;
      }
    } on DioException catch (e) {
      print(e);
    }
  }

  searchMovies({int? page, String? searchText}) async {
    try {
      await setHeaders();
      Map<String, dynamic> query = {
        "language": 'en-US',
        "page": page,
        "query": searchText
      };
      var res = await dio.get("/search/movie", queryParameters: query);
      if (res.statusCode == 200) {
        return res.data["results"];
      } else {
        return null;
      }
    } on DioException catch (e) {
      print(e);
    }
  }
}
