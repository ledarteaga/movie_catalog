import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/controllers/movie_detail_screen_controller.dart';
import 'package:movie_catalog/utils/helpers.dart';
import 'package:movie_catalog/views/cast_screen.dart';
import 'package:movie_catalog/widgets/poster.dart';

import '../models/video.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key, required this.video});

  final Video video;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.background),
        height: 70,
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                video.name ?? '',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: 5,
              ),
              Wrap(
                spacing: 8,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Icon(
                    Icons.play_circle_rounded,
                    size: 18,
                  ),
                  Text(
                    video.site ?? '',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
