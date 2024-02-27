import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/controllers/controllers.dart';
import 'package:movie_catalog/widgets/widgets.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    MovieDetailScreenController c =
        Get.put(MovieDetailScreenController(movieId: id));

    return Obx(() => Scaffold(
          appBar: AppBar(
              title: Text(c.isLoading.value
                  ? 'Cargando...'
                  : c.movie.value.title ?? '')),
          body: c.isLoading.value
              ? const SizedBox.expand(
                  child: Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BackdropWrapper(),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${c.movie.value.title} (${DateTime.tryParse(c.movie.value.releaseDate.toString())?.year ?? ''})',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        if (c.movie.value.overview != null)
                          Text(
                            c.movie.value.overview ?? '',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          c.movie.value.overview ?? 'Sin descripción.',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const GenresChips(),
                        const SizedBox(
                          height: 8,
                        ),
                        const Row(
                          children: [
                            CastButton(),
                            SizedBox(
                              width: 8,
                            ),
                            VideosButton()
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        if (c.images.isNotEmpty) const ImagesRow()
                      ]),
                ),
        ));
  }
}
