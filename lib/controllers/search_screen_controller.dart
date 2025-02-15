import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:movie_catalog/controllers/configurations_controller.dart';
import 'package:movie_catalog/utils/api_helpers.dart';

import '../models/entities.dart';
import '../utils/helpers.dart';

class HomeScreenController extends GetxController {
  var c = Get.find<ConfigurationsController>();
  var results = <Movie>[].obs;
  var isLoading = false.obs;

  Future<List<Movie>> fetchQuery(String query) async {
    isLoading.value = true;
    var result = <Movie>[];

    try {
      dio.Response data = await $http.get('search/movie', queryParameters: {});

      List<dynamic> results = data.data['results'];
      result = results.map<Movie>((e) => Movie.fromJson(e)).toList();
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

    return result;
  }
}
