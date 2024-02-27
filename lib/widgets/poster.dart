import 'package:flutter/material.dart';

import '../utils/utils.dart';

enum PosterSize { sm, md, lg }

class Poster extends StatelessWidget {
  const Poster({super.key, this.path, this.rounded = false, this.width = 160});

  final String? path;
  final double width;
  final bool rounded;

  @override
  Widget build(BuildContext context) {
    placeholderErrorBuilder(context, error, stackTrace) =>
        const SizedBox.expand(
          child: Center(
              child: Icon(
            Icons.error_outline,
            size: 18,
          )),
        );

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              rounded ? const Radius.circular(12) : Radius.zero)),
      width: width,
      child: path == null
          ? Image.asset('assets/placeholder_poster.jpg')
          : FadeInImage.assetNetwork(
              fadeInDuration: const Duration(milliseconds: 300),
              placeholder: 'assets/placeholder_poster.jpg',
              fit: BoxFit.cover,
              placeholderErrorBuilder: placeholderErrorBuilder,
              imageErrorBuilder: placeholderErrorBuilder,
              image: getPosterUrl(path!)),
    );
  }
}
