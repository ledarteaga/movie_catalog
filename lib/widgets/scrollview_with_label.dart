import 'package:flutter/material.dart';
import 'package:movie_catalog/models/movie.dart';
import 'package:movie_catalog/widgets/poster_scrollview.dart';

class ScrollViewWithLabel extends StatelessWidget {
  const ScrollViewWithLabel(
      {super.key, this.title = '', this.movies = const []});

  final String title;
  final List<Movie> movies;

  final TextStyle labelStyle =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: Text(
            title,
            style: labelStyle,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        PosterScrollView(
          movies: movies,
        ),
        const SizedBox(
          height: 15,
        ),
      ]),
    );
  }
}
