import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sidebarx/sidebarx.dart';

// ignore: must_be_immutable
class SideBar extends StatelessWidget {
  late String username;

  static final instance = SideBar._();
  SideBar._();
  factory SideBar(String username) {
    instance.username = username;
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
          title: const Text('Home'),
          onTap: () {
            context.go('/home');
          },
          leading: const Icon(Icons.home),
        ),
        ListTile(
          title: const Text('Profile'),
          onTap: () {
            context.go('/Profile');
          },
          leading: const Icon(Icons.manage_accounts),
        ),
        ListTile(
          title: const Text('Setting'),
          onTap: () {},
          leading: const Icon(Icons.settings),
        ),

        ListTile(
          title: const Text('About'),
          onTap: () {},
          leading: const Icon(Icons.add_box_outlined),
        ),
        ListTile(
          title: const Text('Logout'),
          onTap: () {
            context.go('/logout');
          },
          leading: const Icon(Icons.logout),
        ),
      ],
    ));
  }
}
