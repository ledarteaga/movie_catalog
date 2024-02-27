import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/controllers/movie_detail_screen_controller.dart';
import 'package:movie_catalog/utils/helpers.dart';

class ImagesRow extends StatelessWidget {
  const ImagesRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var c = Get.find<MovieDetailScreenController>();

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 150,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: c.images
                  .map((image) => Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: Card(
                          clipBehavior: Clip.hardEdge,
                          child: Image.network(
                              getBackdropUrl(image.filePath ?? '')),
                        ),
                      ))
                  .toList()),
        ),
      ),
    );
  }
}
