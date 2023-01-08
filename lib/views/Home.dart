import 'package:flutter/material.dart';
import 'package:lean/main.dart';
import 'package:lean/views/commun/SideBar.dart';


class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() {
    MyApp.sideBarApp.setUsername=username;
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  static String? u;


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
      drawer:   MyApp.sideBarApp,
      appBar: AppBar(
        title: const Text("Home Page"),
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
                          TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Write your Post',
                                hintText: 'Post content'
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },

                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    onSend(context, formKey );
                                  }
                                },
                                child: const Text('Send Post')
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

  void onSend(BuildContext context,GlobalKey formKey) {
    final snackBar = SnackBar(
      content: const Text('Post Sent!'),
      duration: const Duration(seconds: 2, milliseconds: 500),
      action: SnackBarAction(
        label: '',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
