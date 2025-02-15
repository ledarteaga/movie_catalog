import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/controllers/login_screen_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(LoginScreenController());

    return Scaffold(
      appBar: CupertinoNavigationBar(
        automaticallyImplyLeading: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20.0,
              children: [
                Icon(
                  Icons.movie_filter_rounded,
                  size: 65.0,
                ),
                Text(
                  'Bienvenido de nuevo...',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(
                  height: 45.0,
                  child: CupertinoTextField(
                    placeholder: 'Usuario',
                    controller: c.userInputController.value,
                  ),
                ),
                SizedBox(
                  height: 45.0,
                  child: CupertinoTextField(
                    placeholder: 'Contraseña',
                    controller: c.passwordInputController.value,
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: CupertinoButton.filled(
                      focusColor: Colors.red,
                      onPressed: c.onLoginButtonPress,
                      child: Text('Iniciar sesión')),
                ),
                SizedBox(
                  width: double.infinity,
                  child: CupertinoButton.filled(
                      focusColor: Colors.red,
                      onPressed: c.onTmbdLoginButtonPress,
                      child: Text('Ingresar con TMDB')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
