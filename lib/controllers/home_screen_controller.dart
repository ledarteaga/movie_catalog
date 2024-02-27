import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/controllers/configurations_controller.dart';
import 'package:movie_catalog/models/movie_details/genre.dart';
import 'package:movie_catalog/utils/api_helpers.dart';

import '../models/entities.dart';
import '../utils/helpers.dart';

class HomeScreenController extends GetxController {
  var c = Get.find<ConfigurationsController>();
  var mostPopular = <Movie>[].obs;
  var nowPlaying = <Movie>[].obs;
  var mostAcclaimed = <Movie>[].obs;
  var popular = <Movie>[].obs;
  var upcoming = <Movie>[].obs;
  var discover = <Movie>[].obs;
  var topRated = <Movie>[].obs;
  var genres = <Genre>[].obs;

  var isLoading = false.obs;

  Future<List<Movie>> fetchMovies(String endpoint) async {
    isLoading.value = true;
    var result = <Movie>[];

    try {
      dio.Response data = await $http.get('movie/$endpoint');

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

  Future fetchGenres() async {
    try {
      dio.Response data = await $http.get('genre/movie/list');

      List<dynamic> results = data.data['genres'];
      genres.value = results.map<Genre>((e) => Genre.fromMap(e)).toList();
    } catch (e) {
      e.printError(info: e.toString());

      showSnackbar(
        'Ha ocurrido un error.',
        message: 'No se han cargado los generor correctamente..',
      );
    }
  }

  Future<void> fetchNowPlaying() async {
    nowPlaying.value = await fetchMovies('now_playing');
  }

  Future<void> fetchTopRated() async {
    topRated.value = await fetchMovies('top_rated');
  }

  Future<void> fetchUpcoming() async {
    upcoming.value = await fetchMovies('upcoming');
  }

  Future<void> fetchDiscover() async {
    upcoming.value = await fetchMovies('dicover');
  }

  @override
  void onInit() {
    // TODO: implement onInit
    Future.wait(
        [fetchNowPlaying(), fetchUpcoming(), fetchTopRated(), fetchGenres()]);

    super.onInit();
  }
}
