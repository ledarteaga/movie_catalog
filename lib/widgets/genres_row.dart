import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controllers.dart';
import '../views/views.dart';

class GenresRow extends StatelessWidget {
  const GenresRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final c = Get.find<HomeScreenController>();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: c.genres.value
              .map((genre) => Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: FilledButton(
                      onPressed: () {
                        Get.to(() => DiscoverScreen(
                            appBarTitle: genre.name ?? '',
                            queryParams: 'with_genres=${genre.id}'));
                      },
                      child: Text(genre.name ?? ''))))
              .toList()),
    );
  }
}
