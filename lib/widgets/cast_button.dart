import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controllers.dart';
import '../views/views.dart';

class CastButton extends StatelessWidget {
  const CastButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var c = Get.find<MovieDetailScreenController>();

    return OutlinedButton(
      onPressed: () {
        Get.to(() => CastScreen(movieId: c.movie.value.id ?? 0));
      },
      child: Row(
        spacing: 8.0,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.people),
          Text(
            'Reparto',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
