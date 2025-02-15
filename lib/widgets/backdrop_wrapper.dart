import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/controllers/movie_detail_screen_controller.dart';
import 'package:movie_catalog/utils/helpers.dart';
import 'package:movie_catalog/widgets/backdrop_image.dart';
import 'package:movie_catalog/widgets/backdrop_overlay.dart';
import 'package:movie_catalog/widgets/poster.dart';
import 'package:movie_catalog/widgets/vote_average.dart';

class BackdropWrapper extends StatelessWidget {
  const BackdropWrapper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final c = Get.find<MovieDetailScreenController>();

    return SizedBox(
      width: double.infinity,
      height: 410,
      child: Stack(alignment: Alignment.bottomCenter, children: [
        if (c.movie.value.backdropPath != null)
          BackdropImage(path: c.movie.value.backdropPath!),
        const BackdropOverlay(),
        if (c.movie.value.posterPath != null)
          Poster(
            path: getPosterUrl(c.movie.value.posterPath!),
          ),
        const VoteAverage()
      ]),
    );
  }
}
