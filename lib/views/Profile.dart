import 'package:flutter/material.dart';
import 'package:lean/main.dart';
import 'package:lean/views/commun/SideBar.dart';


class ProfilePage extends StatefulWidget {
   const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() {
    return ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage> {

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
        title: const Text("Profile Page"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10,
            left: 10,
            right: 10,
            bottom: screenHeight * 0.05),
         child:const Text("Profile")
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
