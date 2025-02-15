import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/controllers/account_screen_controller.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var c = Get.put(AccountScreenController());

    return Obx(() {
      return Scaffold(
        appBar: AppBar(title: const Text('Mi Cuenta')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
              spacing: 20.0,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    child: Icon(
                      Icons.people,
                      size: 50,
                    ),
                  ),
                ),
                Text(c.account.value.username,
                    style: Theme.of(context).textTheme.headlineMedium),
                SizedBox(
                  width: double.infinity,
                  child: CupertinoButton.filled(
                      focusColor: Colors.red,
                      onPressed: c.logout,
                      child: Text('Cerrar sesión')),
                ),
              ]),
        ),
      );
    });
  }
}
