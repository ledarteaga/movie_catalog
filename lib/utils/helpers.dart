import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/controllers/configurations_controller.dart';

String getPosterUrl(String path) {
  final c = Get.find<ConfigurationsController>();
  final baseConfig = c.baseConfig.value;

  final String url = baseConfig.images.baseUrl;
  final String posterSize = baseConfig.images.posterSizes[4];

  return "$url/$posterSize/$path";
}

String getLogoUrl(String path) {
  final c = Get.find<ConfigurationsController>();
  final baseConfig = c.baseConfig.value;

  final String url = baseConfig.images.baseUrl;
  final String posterSize = baseConfig.images.logoSizes[3];

  return "$url/$posterSize/$path";
}

String getBackdropUrl(String path) {
  final c = Get.find<ConfigurationsController>();
  final baseConfig = c.baseConfig.value;

  final String url = baseConfig.images.baseUrl;
  final String posterSize = baseConfig.images.backdropSizes[3];

  return "$url/$posterSize/$path";
}

String getStillUrl(String path) {
  final c = Get.find<ConfigurationsController>();
  final baseConfig = c.baseConfig.value;

  final String url = baseConfig.images.baseUrl;
  final String posterSize = baseConfig.images.stillSizes[3];

  return "$url/$posterSize/$path";
}

String getProfilePath(String path) {
  final c = Get.find<ConfigurationsController>();
  final baseConfig = c.baseConfig.value;

  final String url = baseConfig.images.baseUrl;
  final String posterSize = baseConfig.images.profileSizes[1];

  return "$url/$posterSize/$path";
}

void showSnackbar(String title, {String? message, Color color = Colors.red}) {
  Get.snackbar(
    title,
    message ?? '',
    snackPosition: SnackPosition.TOP,
    duration: const Duration(seconds: 3),
    borderRadius: 13,
    backgroundColor: color.withOpacity(0.2),
    borderColor: color,
    isDismissible: true,
  );
}
