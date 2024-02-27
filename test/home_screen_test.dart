// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_catalog/controllers/home_screen_controller.dart';

import 'package:movie_catalog/main.dart';

void main() {
  testWidgets('Api returns Movie list', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    var controller = HomeScreenController();

    var list = await controller.fetchMovies('now_playing');

    expect(list.isNotEmpty, true);
  });
}
