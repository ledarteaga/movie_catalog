import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/controllers/movie_detail_screen_controller.dart';

class GenresChips extends StatelessWidget {
  const GenresChips({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final c = Get.find<MovieDetailScreenController>();

    return Wrap(
      spacing: 12,
      children: c.movie.value.genres
              ?.map((e) => Chip(
                  visualDensity: VisualDensity.compact,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  label: Text(e.name ?? '',
                      style: Theme.of(context).textTheme.bodySmall)))
              .toList() ??
          [],
    );
  }
}
