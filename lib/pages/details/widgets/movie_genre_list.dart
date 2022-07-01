import 'package:flutter/material.dart';
import 'package:movie_app/pages/details/model/movie_details_model.dart';
import 'package:movie_app/pages/details/widgets/movie_card.dart';

class MovieGenreList extends StatelessWidget {
  const MovieGenreList(
    this._movieDetailsModel, {
    Key? key,
  }) : super(key: key);
  final MovieDetailsModel _movieDetailsModel;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
      child: Wrap(
        children: [
          ...[
            for (var i = 0; i < (_movieDetailsModel.genres?.length ?? 0); i++)
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.yellow,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      _movieDetailsModel.genres?[i].name ?? '',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }
}
