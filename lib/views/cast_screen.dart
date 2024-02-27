import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/controllers/cast_screen_controller.dart';

import '../widgets/widgets.dart';

class CastScreen extends StatelessWidget {
  const CastScreen({super.key, required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    final c = Get.put(CastScreenController(movieId: movieId));

    return Scaffold(
      appBar: AppBar(title: const Text('Reparto')),
      body: Obx(() {
        if (c.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }

        return SingleChildScrollView(
          child: Wrap(
            children: List.from(c.castMembers.value.map((e) => CastMemberCard(
                  castMember: e,
                ))),
          ),
        );
      }),
    );
  }
}
