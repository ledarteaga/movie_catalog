import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/widgets/videos_row.dart';

class VideosButton extends StatelessWidget {
  const VideosButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      color: Theme.of(context).colorScheme.background,
      elevation: 60,
      onPressed: () {
        Get.bottomSheet(
            SizedBox(
                height: MediaQuery.of(context).size.height / 5,
                child: const VideosRow()),
            persistent: false,
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            )));
      },
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.play_arrow),
          SizedBox(
            width: 8,
          ),
          Text('Videos'),
        ],
      ),
    );
  }
}
