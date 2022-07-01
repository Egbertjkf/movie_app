import 'package:get/get.dart';
import 'package:movie_app/pages/details/controller/movie_details_controller.dart';

class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieDetailsController>(() {
      return MovieDetailsController();
    });
  }
}
