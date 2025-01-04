import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/styles/styles.dart';
import 'package:movie_catalog/views/home_screen.dart';

void main() async {
  // $http.interceptors.addAll([jsonDecodeInterceptor]);
  await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();

  runApp(GetMaterialApp(
    title: 'Movie Catalog',
    debugShowCheckedModeBanner: false,
    theme: AppTheme,
    home: const HomeScreen(),
  ));
}
