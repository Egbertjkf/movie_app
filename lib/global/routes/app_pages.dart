import 'package:get/get.dart';
import 'package:movie_app/global/bindings/details_binding.dart';
import 'package:movie_app/global/bindings/home_bindings.dart';
import 'package:movie_app/global/constants/routes.dart';
import 'package:movie_app/pages/details/view/details_page.dart';
import 'package:movie_app/pages/home/view/home_page.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.details,
      page: () => DetailsPage(),
      arguments: 'movieModel',
      binding: DetailsBinding(),
    ),
  ];
}
