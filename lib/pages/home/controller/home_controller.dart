import 'package:get/get.dart';
import 'package:movie_app/global/model/movie_model.dart';
import 'package:movie_app/global/repository/live_movie_repository.dart';
import 'package:movie_app/global/repository/movie_details_repository.dart';
import 'package:movie_app/global/repository/popular_movie_repository.dart';

class HomeController extends GetxController {
  final _liveMovieRep = LiveMovieRepository();
  final _detailsMovieRep = MovieDetailsRepository();
  final _popularMovieRep = PopularMovieRepository();

  List<MovieModel>? liveMovieList;
  List<MovieModel>? popularMovieList;

  @override
  void onInit() async {
    super.onInit();
    getLiveMoviesList();
    getPopularMoviesList();
  }

  Future<void> getLiveMoviesList() async {
    liveMovieList = null;
    update();

    liveMovieList = await _liveMovieRep.getMovies();
    update();
  }

  Future<void> getPopularMoviesList() async {
    popularMovieList = null;
    update();
    popularMovieList = await _popularMovieRep.getMovies();
    update();
  }
}
