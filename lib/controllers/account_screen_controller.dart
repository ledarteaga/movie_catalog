import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/controllers/auth_controller.dart';
import 'package:movie_catalog/utils/api_helpers.dart';

import '../models/account.dart';

class AccountScreenController extends GetxController {
  var account = Account.empty().obs;
  var loading = false.obs;

  Future<void> fetchAccount() async {
    var c = Get.put(AuthController());

    loading.value = true;
    try {
      final data = await $http
          .get('account', queryParameters: {'session_id': c.sessionId.value});
      final result = Account.fromMap(data.data);
      account.value = result;
      c.accountId.value = result.id;
    } catch (e) {
      inspect(e);
    } finally {
      loading.value = false;
    }
  }

  Future<bool> logout() async {
    var c = Get.put(AuthController());

    var result = await c.deleteSession();

    Get.back();

    if (!result) {
      Get.showSnackbar(GetSnackBar(
        title: 'Error',
        message: 'Ha ocurrido un error al cerrar la sesion',
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
      ));
    }

    return result;
  }

  @override
  void onInit() {
    fetchAccount();

    super.onInit();
  }
}
