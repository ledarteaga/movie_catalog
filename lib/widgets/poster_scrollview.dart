import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/models/movie.dart';
import 'package:movie_catalog/views/movie_detail_screen.dart';

import 'widgets.dart';

class PosterScrollView extends StatelessWidget {
  const PosterScrollView({super.key, this.movies = const []});

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: movies
              .map<Widget>((movie) => GestureDetector(
                    onTap: () => Get.to(
                      () => MovieDetailScreen(id: movie.id),
                    ),
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Poster(
                          width: (MediaQuery.of(context).size.width / 3) - 10,
                          rounded: true,
                          path: movie.posterPath,
                        )),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
