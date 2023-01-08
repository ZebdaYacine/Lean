import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  final userNameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10,
            left: 10,
            right: 10,
            bottom: screenHeight * 0.05),
        child: Column(
          children: [
               FadeInImage.assetNetwork(
                width: 150,
                height: 150,
                placeholder: "lib/images/loading.gif",
                image: "https://www.edigitalagency.com.au/wp-content/uploads/Twitter-logo-png.png",
              ),
             Form(
                  key: formKey,
                  child: Center(
                    child: Column(
                        children: [
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
                              style:  ButtonStyle(
                                minimumSize: MaterialStateProperty.all(const Size(200, 40)),
                              ),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    context.go('/home',extra: userNameController.text);
                                  }
                                },
                                child: const Text('Login')
                            ),
                          )
                        ]
                    ),
                  )
              ),
          ],
        ),
      ),
    );
  }


}
