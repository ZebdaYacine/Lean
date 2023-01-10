import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:lean/models/User.dart';
import 'package:lean/views/commun/Themes.dart';

import '../Controllers/LoginCtrl.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final userNameController = TextEditingController();

  void login(dynamic formKey) {
    if (formKey.currentState!.validate()) {
      bool isDataCorrect=LoginCtrl.isDataCorrect(User(username: "admin", password: "admin"));
      print(isDataCorrect);
      if (isDataCorrect) {
        context.go('/home', extra: userNameController.text);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return RawKeyboardListener(
        autofocus: true,
        focusNode: FocusNode(),
        onKey: (event) {
          if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
            login(formKey);
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text("Login Page"),
          ),
          body: Padding(
            padding: EdgeInsets.only(
                top: 10, left: 10, right: 10, bottom: screenHeight * 0.05),
            child: Column(
              children: [
                FadeInImage.assetNetwork(
                  width: 150,
                  height: 150,
                  placeholder: "lib/images/loading.gif",
                  image:
                      "https://www.edigitalagency.com.au/wp-content/uploads/Twitter-logo-png.png",
                ),
                Form(
                    key: formKey,
                    child: Center(
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: TextFormField(
                            controller: userNameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'User name',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'username  empty';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'password  empty';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: ElevatedButton(
                              style: Themes.sampeleStyle,
                              onPressed: () {
                                login(formKey);
                              },
                              child: const Text('Login')),
                        )
                      ]),
                    )),
              ],
            ),
          ),
        ));
  }
}
