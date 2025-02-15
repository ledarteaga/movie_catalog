import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/controllers/auth_controller.dart';
import 'package:movie_catalog/controllers/configurations_controller.dart';
import 'package:movie_catalog/controllers/home_screen_controller.dart';
import 'package:movie_catalog/views/login_screen.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ConfigurationsController());
    Get.put(AuthController());

    final c = Get.put(HomeScreenController());

    return Scaffold(
      appBar: AppBar(title: const Text('Movies'), actions: [
        IconButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.transparent)),
            onPressed: () => {},
            icon: Icon(Icons.search)),
        IconButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.transparent)),
            onPressed: c.onUserButtonPress,
            icon: Icon(Icons.person)),
      ]),
      body: Obx(() => SizedBox(
            height: double.infinity,
            child: c.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(children: [
                      const GenresRow(),
                      const SizedBox(
                        height: 20,
                      ),
                      if (c.nowPlaying.isNotEmpty)
                        ScrollViewWithLabel(
                          movies: c.nowPlaying,
                          title: 'Now Playing',
                        ),
                      if (c.topRated.isNotEmpty)
                        ScrollViewWithLabel(
                          movies: c.topRated,
                          title: 'Top Rated',
                        ),
                      if (c.upcoming.isNotEmpty)
                        ScrollViewWithLabel(
                          movies: c.upcoming,
                          title: 'Upcoming',
                        ),
                    ]),
                  ),
          )),
    );
  }
}
