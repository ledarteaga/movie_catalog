import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/controllers/controllers.dart';
import 'package:movie_catalog/widgets/genre_text_row.dart';
import 'package:movie_catalog/widgets/widgets.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    MovieDetailScreenController c =
        Get.put(MovieDetailScreenController(movieId: id));

    return Obx(() => Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(c.watchlist.value
                    ? Icons.remove_red_eye
                    : Icons.remove_red_eye_outlined),
                onPressed: c.updateWatchlistState,
              ),
              IconButton(
                icon: Icon(
                    c.favorite.value ? Icons.favorite : Icons.favorite_border),
                onPressed: c.updateFavoriteState,
              )
            ],
          ),
          body: c.isLoading.value
              ? const SizedBox.expand(
                  child: Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: [
                    const BackdropWrapper(),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        spacing: 8.0,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '${c.movie.value.title} (${DateTime.tryParse(c.movie.value.releaseDate.toString())?.year ?? ''})',
                              style: Theme.of(context).textTheme.headlineLarge),
                          if (c.movie.value.overview != null)
                            Text(
                              c.movie.value.overview ?? '',
                            ),
                          const GenreTextRow(),
                          SizedBox(
                            height: 5.0,
                          ),
                          Center(
                            child: StarRating(
                              rating: c.ratingValue.value,
                              allowHalfRating: true,
                              size: 40.0,
                              onRatingChanged: c.updateRating,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
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
                          const Divider(),
                          if (c.images.isNotEmpty) const ImagesRow()
                        ],
                      ),
                    ),
                  ]),
                ),
        ));
  }
}
