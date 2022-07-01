import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/global/bindings/home_bindings.dart';
import 'package:movie_app/global/constants/routes.dart';
import 'package:movie_app/global/routes/app_pages.dart';
import 'package:movie_app/pages/home/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Movie App',
      getPages: AppPages.routes,
      initialBinding: HomeBinding(),
      initialRoute: Routes.home,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
