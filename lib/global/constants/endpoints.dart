class Endpoints {
  final apiKey = '';
  Uri getLiveMovieEndpoint() {
    return Uri.parse('https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey');
  }

  Uri getPopularMovieEndpoint() {
    return Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=$apiKey');
  }

  Uri getMovieDetailsEndpoiont(int movieId) {
    return Uri.parse('https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey&language=pt-BR');
  }

  String getImageUrl(String imagePath, String imageSize) {
    return 'https://image.tmdb.org/t/p/$imageSize/$imagePath';
  }
}
