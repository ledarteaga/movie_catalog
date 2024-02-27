import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/models/cast_member.dart';
import 'package:movie_catalog/utils/api_helpers.dart';
import 'package:movie_catalog/utils/helpers.dart';

class CastScreenController extends GetxController {
  CastScreenController({required this.movieId});
  final int movieId;

  var castMembers = <CastMember>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchCastMember(movieId);
    super.onInit();
  }

  @override
  void onClose() {
    castMembers.value = [];
    super.onClose();
  }

  Future fetchCastMember(int id) async {
    isLoading.value = true;

    try {
      final data = await $http.get('movie/$id/credits');
      final List<CastMember> result = data.data['cast']
          .map<CastMember>((e) => CastMember.fromMap(e))
          .toList();

      castMembers.value = result;
    } catch (e) {
      debugPrint(e.toString());

      showSnackbar(
        'Ha ocurrido un error.',
        message: 'No se han cargado el reparto correctamente..',
      );
    } finally {
      isLoading.value = false;
    }
  }
}
