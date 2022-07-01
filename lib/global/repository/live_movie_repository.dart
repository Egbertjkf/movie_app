import 'package:flutter/cupertino.dart';
import 'package:movie_app/global/constants/endpoints.dart';
import 'package:movie_app/global/model/movie_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LiveMovieRepository {
  String apiKey;
  LiveMovieRepository({this.apiKey = 'e3396e62295740f6bd1f73f9af1d2b88'});

  Future<List<MovieModel>> getMovies() async {
    try {
      final response = await http.get(Endpoints().getLiveMovieEndpoint());

      if (response.statusCode == 200) {
        final jsonObj = convert.json.decode(response.body);
        // var jsonResponse = convert.json.decode(jsonObj['results']);
        List<MovieModel> movies = List<MovieModel>.from(
          jsonObj['results'].map((item) => MovieModel.fromJson(item)),
        );
        return movies;
      } else {
        debugPrint('Erro status: ${response.statusCode}');
        return [];
      }
    } on Exception catch (e) {
      debugPrint('erro: $e');
      return [];
    }
  }
}
