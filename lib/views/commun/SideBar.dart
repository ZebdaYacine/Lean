import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SideBar extends StatelessWidget {
  late String username;

  static final instance = SideBar._();
  SideBar._();
  factory SideBar(String  username){
    instance.username=username;
    return instance;
  }


  String? get getUsername => username;

  void set setUsername(String username) {
    this.username = username;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          child: DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Center(
              child: Column(children: [
                Image(
                  image: const AssetImage('lib/images/profile.jpg'),
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Text(getUsername!!),
              ]),
            ),
          ),
        ),
        ListTile(
          title: const Text('Item 1'),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Item 2'),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Item 3'),
          onTap: () {},
        ),
      ],
    ));
  }
}
