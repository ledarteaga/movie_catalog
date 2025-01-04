import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/widgets/videos_row.dart';

class VideosButton extends StatelessWidget {
  const VideosButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Get.bottomSheet(
            SizedBox(
                height: MediaQuery.of(context).size.height / 5,
                child: const VideosRow()),
            persistent: false,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            )));
      },
      child: Row(
        spacing: 8.0,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.play_arrow),
          Text(
            'Videos',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
