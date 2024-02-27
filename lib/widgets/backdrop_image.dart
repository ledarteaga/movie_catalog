import 'package:flutter/material.dart';
import 'package:movie_catalog/utils/helpers.dart';

class BackdropImage extends StatelessWidget {
  const BackdropImage({
    super.key,
    required this.path,
  });

  final String path;

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/placeholder_poster.jpg',
      placeholderCacheWidth: MediaQuery.of(context).size.width.toInt(),
      placeholderCacheHeight: 300,
      image: getBackdropUrl(path),
      placeholderFit: BoxFit.cover,
      placeholderErrorBuilder: (context, error, stackTrace) => Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.grey[700]),
      ),
      imageErrorBuilder: (context, error, stackTrace) => Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.grey[700]),
      ),
      fit: BoxFit.cover,
      height: double.infinity,
    );
  }
}
