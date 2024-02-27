import 'dart:developer';

import 'package:get/get.dart';
import 'package:movie_catalog/utils/api_helpers.dart';
import 'package:movie_catalog/utils/helpers.dart';

import '../models/entities.dart';

class DiscoverScreenController extends GetxController {
  DiscoverScreenController({required this.queryParams});
  final String queryParams;
  var movies = <Movie>[].obs;
  var isLoading = false.obs;

  Future fetchMovies() async {
    var result = <Movie>[];
    isLoading.value = true;

    try {
      final data = await $http.get('discover/movie?$queryParams');

      List<dynamic> results = data.data['results'];
      result = results.map<Movie>((e) => Movie.fromJson(e)).toList();
      movies.value = result;
    } catch (e) {
      e.printError(info: e.toString());
      inspect(e);

      showSnackbar(
        'Ha ocurrido un error.',
        message: 'No se han cargado las peliculas correctamente..',
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    fetchMovies();
    super.onInit();
  }

  @override
  void onClose() {
    movies.value = [];
    super.onClose();
  }
}
