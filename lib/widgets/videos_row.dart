import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/controllers/movie_detail_screen_controller.dart';
import 'package:movie_catalog/widgets/video_card.dart';

class VideosRow extends StatelessWidget {
  const VideosRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var c = Get.find<MovieDetailScreenController>();

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 70,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: c.videos
                .map((video) => Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: VideoCard(video: video),
                    ))
                .toList()),
      ),
    );
  }
}
