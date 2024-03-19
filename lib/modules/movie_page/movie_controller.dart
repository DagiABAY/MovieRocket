import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_rocket/apis/movie_api.dart';
import 'package:movie_rocket/models/movie.dart';
import 'package:movie_rocket/utils/search_cate.dart';

class MovieController extends GetxController {
  final TextEditingController searchText = TextEditingController();
  RxList<Movie> movies = <Movie>[].obs;
  final movieApi = MovieApi();

  RxString searchCate = SearchCategory.popular.obs;
  @override
  void onInit() {
    getMovies();
    super.onInit();
  }

  getMovies() async {
    var res;

    if (searchCate.isNotEmpty) {
      print("trueeeeeee");
      if (searchCate.value == SearchCategory.popular) {
        res = await movieApi.getPopularMovies(page: 1);
      } else if (searchCate.value == SearchCategory.upcoming) {
        res = await movieApi.getUpcomingMovies(page: 1);
      } else if (searchCate.value == SearchCategory.toprated) {
        res = await movieApi.getTopRated(page: 1);
      } else if (searchCate.value == SearchCategory.none) {
        res = [];
      }
    } else {
      print("innn");
      res = await movieApi.searchMovies(page: 1, searchText: searchText.text);
    }
    if (res != null) {
      movies.clear();
      res.forEach((item) {
        Movie movie = Movie.fromJson(item);
        movies.add(movie);
      });
    }
  }

  void updateSearchCategory(String? category) async {
    try {
      searchCate.value = category!;
      getMovies();
    } catch (e) {
      print(e);
    }
  }

  void updateTextSearch(String? text) async {
    try {
      searchText.text = text!;
      getMovies();
    } catch (e) {
      print(e);
    }
  }
}
