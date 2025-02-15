import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/controllers/auth_controller.dart';
import 'package:movie_catalog/views/tmdb_web_view_screen.dart';
import 'package:movie_catalog/views/views.dart';

class LoginScreenController extends GetxController {
  LoginScreenController();
  var userInputController = TextEditingController().obs;
  var passwordInputController = TextEditingController().obs;

  Future<void> onLoginButtonPress() async {
    var c = Get.put(AuthController());

    bool hasRequestToken = false;
    bool isRequestTokenValid = false;
    bool hasSession = false;

    hasRequestToken = await c.createRequestToken();

    if (hasRequestToken) {
      isRequestTokenValid = await c.validateRequestToken(
          userInputController.value.text, passwordInputController.value.text);
    }

    if (isRequestTokenValid) hasSession = await c.createSession();

    if (hasSession) {
      Get.back();

      Get.showSnackbar(GetSnackBar(
          title: 'Acceso exitoso.',
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
          snackPosition: SnackPosition.TOP,
          message: 'Bienvenido de nuevo.'));
    }
  }

  Future<void> onTmbdLoginButtonPress() async {
    Get.bottomSheet(TmdbWebViewScreen());
  }
}
