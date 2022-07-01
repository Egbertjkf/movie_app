import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/global/constants/endpoints.dart';
import 'package:movie_app/global/widgets/text_widget.dart';
import 'package:movie_app/pages/home/controller/home_controller.dart';
import 'package:movie_app/pages/home/widgets/movie_big_poster_list.dart';
import 'package:movie_app/pages/home/widgets/movie_small_poster_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController _homeController = Get.find();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filmes'),
          centerTitle: true,
          leading: const Icon(Icons.list_sharp),
          backgroundColor: const Color.fromARGB(255, 17, 17, 17),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 17, 17, 17),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SectionTitleWidget('Ao vivo agora'),
            GetBuilder<HomeController>(
              // init: MyController(),
              initState: (_) {},
              builder: (_) {
                return MovieBigPosterList(_homeController.liveMovieList);
              },
            ),
            const SectionTitleWidget('Filmes Populares'),
            GetBuilder<HomeController>(
              initState: (_) {},
              builder: (_) {
                return MovieSmallPosterList(_homeController.popularMovieList);
              },
            )
          ],
        ));
  }
}
