import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/controllers/movie_detail_screen_controller.dart';

class VoteAverage extends StatelessWidget {
  const VoteAverage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final c = Get.find<MovieDetailScreenController>();

    return Positioned(
      right: 10,
      bottom: 5,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.end,
        children: [
          const Icon(
            Icons.star,
            size: 20,
            color: Colors.yellow,
          ),
          Text(
            c.movie.value.voteAverage?.toString() ?? 0.toString(),
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
