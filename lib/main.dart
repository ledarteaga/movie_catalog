import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/controllers/configurations_controller.dart';
import 'package:movie_catalog/utils/api_helpers.dart';
import 'package:movie_catalog/views/home_screen.dart';

void main() async {
  // $http.interceptors.addAll([jsonDecodeInterceptor]);
  await dotenv.load(fileName: "../.env");

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const GetMaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(ConfigurationsController());

    return MaterialApp(
      title: 'Movie Catalog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
