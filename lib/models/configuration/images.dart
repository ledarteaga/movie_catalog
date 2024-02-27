import 'package:flutter/material.dart';

@immutable
class Images {
  final String baseUrl = "http://image.tmdb.org/t/p/";
  final String secureBaseUrl = "https://image.tmdb.org/t/p/";

  final List<String> backdropSizes = ["w300", "w780", "w1280", "original"];

  final List<String> logoSizes = [
    "w45",
    "w92",
    "w154",
    "w185",
    "w300",
    "w500",
    "original"
  ];

  final List<String> posterSizes = [
    "w92",
    "w154",
    "w185",
    "w342",
    "w500",
    "w780",
    "original"
  ];

  final List<String> profileSizes = ["w45", "w185", "h632", "original"];

  final List<String> stillSizes = ["w92", "w185", "w300", "original"];
}
