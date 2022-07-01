import 'package:flutter/material.dart';
import 'package:movie_app/global/constants/endpoints.dart';
import 'package:movie_app/pages/details/model/movie_details_model.dart';
import 'package:movie_app/pages/details/widgets/movie_genre_list.dart';

class MovieDetailsCard extends StatelessWidget {
  const MovieDetailsCard(
    this._movieDetailsModel, {
    Key? key,
    this.imagePosterPath,
  }) : super(key: key);
  final MovieDetailsModel _movieDetailsModel;
  final String? imagePosterPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(.50),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
            child: SizedBox(
              child: Image.network(
                Endpoints().getImageUrl(
                  imagePosterPath ?? '',
                  'w92',
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.65),
                  child: Text(
                    _movieDetailsModel.title ?? '',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4.0),
                child: MovieGenreList(_movieDetailsModel),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'Nota: ${_movieDetailsModel.voteAverage?.toString() ?? ''}/10',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
