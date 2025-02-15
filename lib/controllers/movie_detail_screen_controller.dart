import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/controllers/auth_controller.dart';

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
  var favorite = false.obs;
  var watchlist = false.obs;
  var ratingValue = 0.0.obs;

  var isLoading = false.obs;
  var isLoadingVideos = false.obs;

  Future fetchMovieDetails() async {
    isLoading.value = true;

    try {
      final data = await $http.get('movie/$movieId');
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

  Future fetchMovieVideos() async {
    isLoadingVideos.value = true;

    try {
      final data = await $http.get('movie/$movieId/videos');
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

  Future fetchMovieImages() async {
    isLoadingVideos.value = true;

    try {
      final data = await $http.get('movie/$movieId/images');
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

  Future updateFavoriteState() async {
    var c = Get.put(AuthController());
    var body = <String, dynamic>{};

    if (c.isLoggedIn == false) {
      c.redirectToLogin();

      return;
    }

    body['media_type'] = 'movie';
    body['media_id'] = movieId;
    body['favorite'] = !favorite.value;

    try {
      var response = await $http.post('account/${c.accountId.value}/favorite',
          queryParameters: {'session_id': c.sessionId.value},
          data: jsonEncode(body));

      if (response.data['success']) {
        fetchAccountStates();
      }
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: 'Error',
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
        message: 'Ha ocurrido un error.',
      ));
    }
  }

  Future updateWatchlistState() async {
    var c = Get.put(AuthController());
    var body = <String, dynamic>{};

    if (c.isLoggedIn == false) {
      c.redirectToLogin();

      return;
    }

    body['media_type'] = 'movie';
    body['media_id'] = movieId;
    body['watchlist'] = !watchlist.value;

    try {
      var response = await $http.post('account/${c.accountId.value}/watchlist',
          queryParameters: {'session_id': c.sessionId.value},
          data: jsonEncode(body));

      if (response.data['success']) {
        fetchAccountStates();
      }
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: 'Error',
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
        message: 'Ha ocurrido un error.',
      ));
    }
  }

  Future updateRating(double rating) async {
    var c = Get.put(AuthController());
    var body = <String, dynamic>{};

    body['value'] = rating;

    try {
      var response = await $http.post('movie/$movieId/rating',
          queryParameters: {'session_id': c.sessionId.value},
          data: jsonEncode(body));

      if (response.data['success']) {
        fetchAccountStates();
      }
    } on DioException catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: 'Error',
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
        message: 'Ha ocurrido un error.',
      ));
    }
  }

  Future fetchAccountStates() async {
    var c = Get.put(AuthController());

    if (c.isLoggedIn == false) return;

    try {
      final data = await $http.get('movie/$movieId/account_states',
          queryParameters: {'session_id': c.sessionId.value});

      favorite.value = data.data['favorite'];
      watchlist.value = data.data['watchlist'];
      ratingValue.value =
          data.data['rated'] != false ? data.data['rated']['value'] : 0.0;
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: 'Error',
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
        message: 'Ha ocurrido un error.',
      ));
    }
  }

  @override
  void onInit() {
    Future.wait([
      fetchMovieDetails(),
      fetchMovieImages(),
      fetchMovieVideos(),
      fetchAccountStates()
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
