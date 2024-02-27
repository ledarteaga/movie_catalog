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

    return MaterialButton(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      color: Theme.of(context).colorScheme.background,
      elevation: 60,
      onPressed: () {
        Get.to(() => CastScreen(movieId: c.movie.value.id ?? 0));
      },
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.people),
          SizedBox(
            width: 8,
          ),
          Text('Reparto'),
        ],
      ),
    );
  }
}
