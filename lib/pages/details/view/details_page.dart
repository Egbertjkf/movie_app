import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/global/constants/endpoints.dart';
import 'package:movie_app/global/model/movie_model.dart';
import 'package:movie_app/global/widgets/text_widget.dart';
import 'package:movie_app/pages/details/controller/movie_details_controller.dart';
import 'package:movie_app/pages/details/widgets/movie_card.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  MovieModel args = Get.arguments;
  final MovieDetailsController _movieDetailsController = Get.find();

  @override
  void initState() {
    super.initState();
    _movieDetailsController.getMovieDetails(args.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 17, 17),
      body: SizedBox(
          child: SingleChildScrollView(
              child: GetBuilder<MovieDetailsController>(
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              clipBehavior: Clip.hardEdge,
              // fit: StackFit.loose,
              children: [
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Image.network(
                    Endpoints().getImageUrl(
                      args.backdropPath ?? '',
                      'w780',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 175),
                  child: MovieDetailsCard(
                    _movieDetailsController.selectedMovieDetails,
                    imagePosterPath: args.posterPath,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Card(
                color: Colors.black.withOpacity(.50),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Sinopse: ${_movieDetailsController.selectedMovieDetails.overview ?? ''}',
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: ElevatedButton(
                  onPressed: () => Get.back(),
                  child: const Text(
                    'Voltar',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.yellow)),
            )
          ],
        ),
      ))),
    );
  }
}
