import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart' as dio;
import 'package:movie_catalog/controllers/account_screen_controller.dart';
import 'package:movie_catalog/utils/api_helpers.dart';
import 'package:movie_catalog/views/login_screen.dart';

class AuthController extends GetxController {
  AuthController();
  var sessionId = ''.obs;
  var requestToken = ''.obs;
  var accountId = 0.obs;

  void setSessionId(String token) {
    sessionId.value = token;
  }

  void clearSessionId() {
    sessionId.value = '';
  }

  void setRequestToken(String token) {
    requestToken.value = token;
  }

  void clearRequestToken() {
    requestToken.value = '';
  }

  bool get isLoggedIn => sessionId.value.isNotEmpty;

  void redirectToLogin() {
    Get.to(() => const LoginScreen(), fullscreenDialog: true);
  }

  Future<bool> createRequestToken() async {
    var body = <String, dynamic>{};
    var result = true;

    try {
      var response = await $http.get('authentication/token/new');

      result = response.data['success'];

      if (result) requestToken.value = response.data['request_token'];
    } catch (e) {
      result = false;
    }

    return result;
  }

  Future<bool> validateRequestToken(String username, String password) async {
    try {
      var requestBody = <String, dynamic>{};

      requestBody['username'] = username;
      requestBody['password'] = password;
      requestBody['request_token'] = requestToken.value;

      dio.Response loginData = await $http.post(
          'authentication/token/validate_with_login',
          data: jsonEncode(requestBody));

      return loginData.data['success'];
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 401) {
        Get.showSnackbar(GetSnackBar(
          title: 'Credenciales incorrectas.',
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
          snackPosition: SnackPosition.TOP,
          message: 'Intente nuevamente.',
        ));
      }

      return false;
    }
  }

  Future<bool> createSession() async {
    var c = Get.put(AccountScreenController());
    var body = <String, dynamic>{};
    var result = true;

    body['request_token'] = requestToken.value;

    try {
      var response = await $http.post('authentication/session/new',
          data: jsonEncode(body));

      result = response.data['success'];

      if (result) {
        sessionId.value = response.data['session_id'];

        //Completa id de usuario
        c.fetchAccount();
      }
    } catch (e) {
      result = false;
    }

    return result;
  }

  Future<bool> deleteSession() async {
    var body = <String, dynamic>{};
    var result = true;

    try {
      body['session_id'] = sessionId.value;
      var response =
          await $http.delete('authentication/session', data: jsonEncode(body));

      result = response.data['success'];

      if (result) clearSessionId();
    } catch (e) {
      result = false;
    }

    return result;
  }
}
