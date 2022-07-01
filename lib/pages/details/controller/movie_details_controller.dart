import 'package:get/get.dart';

import 'package:movie_app/global/repository/movie_details_repository.dart';
import 'package:movie_app/pages/details/model/movie_details_model.dart';

class MovieDetailsController extends GetxController {
  MovieDetailsRepository _movieDetailsRepository = MovieDetailsRepository();
  MovieDetailsModel selectedMovieDetails = MovieDetailsModel();

  void getMovieDetails(movieId) async {
    selectedMovieDetails = await _movieDetailsRepository.getMovies(movieId ?? 0);
    update();
  }
}
