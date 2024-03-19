import 'package:get/get.dart';
import 'package:movie_rocket/modules/movie_page/movie_controller.dart';

class MovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieController());
  }
}
