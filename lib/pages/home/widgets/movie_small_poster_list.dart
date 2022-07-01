import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/global/constants/endpoints.dart';
import 'package:movie_app/global/model/movie_model.dart';

class MovieSmallPosterList extends StatelessWidget {
  const MovieSmallPosterList(this.movieList, {Key? key}) : super(key: key);
  final List<MovieModel>? movieList;

  @override
  Widget build(BuildContext context) {
    return movieList != null
        ? InkWell(
            child: SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movieList?.length ?? 0,
                // shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 4.0, left: (index == 0 ? 8.0 : 0.0)),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed('/details', arguments: movieList?[index]);
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Image.network(Endpoints().getImageUrl(movieList?[index].posterPath ?? '', 'w185'), fit: BoxFit.contain),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        : Container();
  }
}
