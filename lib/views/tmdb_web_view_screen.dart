import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/controllers/auth_controller.dart';
import 'package:movie_catalog/views/views.dart';

class TmdbWebViewScreen extends StatelessWidget {
  const TmdbWebViewScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var c = Get.put(AuthController());

    onLoadStop(InAppWebViewController controller, WebUri? url) async {
      bool isAllowedUrl = url?.rawValue.contains('allow') ?? false;

      if (isAllowedUrl) {
        c.setSessionId(url?.pathSegments[1] ?? '');

        if (Get.isBottomSheetOpen ?? false) {
          Get.showSnackbar(GetSnackBar(
              title: 'Acceso exitoso.',
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
              snackPosition: SnackPosition.TOP,
              message: 'Bienvenido de nuevo.'));

          Get.back();

          await Get.off(HomeScreen());
        }
      }
    }

    return Obx(() {
      return Scaffold(
        appBar: AppBar(title: const Text('Ingresar con TMBD')),
        body: SizedBox(
          height: Get.height - 80,
          child: InAppWebView(
              onLoadStop: onLoadStop,
              initialUrlRequest: URLRequest(
                  url: WebUri(
                      'https://www.themoviedb.org/authenticate/${c.requestToken}'))),
        ),
      );
    });
  }
}
