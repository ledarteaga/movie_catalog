import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/controllers/discover_screen_controller.dart';
import 'package:movie_catalog/utils/helpers.dart';
import 'package:movie_catalog/views/movie_detail_screen.dart';
import 'package:movie_catalog/widgets/poster_scrollview.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen(
      {super.key, required this.appBarTitle, required this.queryParams});

  final String appBarTitle;
  final String queryParams;

  @override
  Widget build(BuildContext context) {
    final c = Get.put(DiscoverScreenController(queryParams: queryParams));

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Obx(() {
        if (c.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }

        return ListView.builder(
            itemBuilder: (context, index) => MovieRow(movie: c.movies[index]),
            itemCount: c.movies.length);
      }),
    );
  }
}

class MovieRow extends StatelessWidget {
  const MovieRow({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => MovieDetailScreen(id: movie.id)),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15, left: 8, top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Poster(
              rounded: false,
              path: getPosterUrl(
                movie.posterPath!,
              ),
              width: 80,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    movie.releaseDate.year.toString(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
