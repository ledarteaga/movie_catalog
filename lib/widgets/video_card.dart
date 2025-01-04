import 'package:flutter/material.dart';

import '../models/video.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key, required this.video});

  final Video video;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
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
