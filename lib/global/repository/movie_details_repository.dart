import 'package:movie_app/global/model/movie_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:movie_app/global/constants/endpoints.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:movie_app/pages/details/model/movie_details_model.dart';

class MovieDetailsRepository {
  MovieDetailsRepository();

  Future<MovieDetailsModel> getMovies(int movieId) async {
    try {
      final response = await http.get(Endpoints().getMovieDetailsEndpoiont(movieId));

      if (response.statusCode == 200) {
        final jsonObj = convert.json.decode(response.body);
        MovieDetailsModel movieDetails = MovieDetailsModel.fromJson(jsonObj);
        return movieDetails;
      } else {
        debugPrint('Erro status: ${response.statusCode}');
        return MovieDetailsModel();
      }
    } on Exception catch (e) {
      debugPrint('erro: $e');
      return MovieDetailsModel();
    }
  }
}
