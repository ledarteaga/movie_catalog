import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:movie_catalog/utils/api_helpers.dart';
import 'package:movie_catalog/utils/helpers.dart';

import '../models/models.dart';
import '../models/movie_details/movie_detail.dart';

class MovieDetailScreenController extends GetxController {
  MovieDetailScreenController({required this.movieId});
  final int movieId;

  var movie = const MovieDetails().obs;
  var videos = <Video>[].obs;
  var images = <MovieImage>[].obs;

  var isLoading = false.obs;
  var isLoadingVideos = false.obs;

  Future fetchMovieDetails(int id) async {
    isLoading.value = true;

    try {
      final data = await $http.get('movie/$id');
      final result = MovieDetails.fromMap(data.data);

      movie.value = result;
    } catch (e) {
      debugPrint(e.toString());

      showSnackbar(
        'Ha ocurrido un error.',
        message: 'No se han cargado las peliculas correctamente..',
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future fetchMovieVideos(int id) async {
    isLoadingVideos.value = true;

    try {
      final data = await $http.get('movie/$id/videos');
      final List<Video> result =
          data.data['results'].map<Video>((e) => Video.fromMap(e)).toList();

      videos.value =
          result.where((element) => element.site == 'YouTube').toList();
    } catch (e) {
      debugPrint(e.toString());

      showSnackbar(
        'Ha ocurrido un error.',
        message: 'No se han cargado los videos correctamente..',
      );
    } finally {
      isLoadingVideos.value = false;
    }
  }

  Future fetchMovieImages(int id) async {
    isLoadingVideos.value = true;

    try {
      final data = await $http.get('movie/$id/images');
      final List<MovieImage> result = data.data['backdrops']
          .map<MovieImage>((e) => MovieImage.fromMap(e))
          .toList();

      images.value = result;
    } catch (e) {
      debugPrint(e.toString());

      showSnackbar(
        'Ha ocurrido un error.',
        message: 'No se han cargado las imagenes correctamente..',
      );
    } finally {
      isLoadingVideos.value = false;
    }
  }

  @override
  void onInit() {
    Future.wait([
      fetchMovieDetails(movieId),
      fetchMovieImages(movieId),
      fetchMovieVideos(movieId)
    ]);

    super.onInit();
  }

  @override
  void onClose() {
    videos.value = [];
    images.value = [];
    super.onClose();
  }
}
