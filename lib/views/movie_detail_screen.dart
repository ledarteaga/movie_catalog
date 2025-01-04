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
                      spacing: 8.0,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BackdropWrapper(),
                        Text(
                            '${c.movie.value.title} (${DateTime.tryParse(c.movie.value.releaseDate.toString())?.year ?? ''})',
                            style: Theme.of(context).textTheme.headlineLarge),
                        if (c.movie.value.overview != null)
                          Text(
                            c.movie.value.overview ?? '',
                          ),
                        const GenresChips(),
                        const Row(
                          children: [
                            CastButton(),
                            SizedBox(
                              width: 8,
                            ),
                            VideosButton()
                          ],
                        ),
                        const Divider(),
                        if (c.images.isNotEmpty) const ImagesRow()
                      ]),
                ),
        ));
  }
}
