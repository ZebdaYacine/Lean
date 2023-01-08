import 'package:flutter/material.dart';
import 'package:lean/routing/AppRoute.dart';
import 'package:lean/views/commun/SideBar.dart';
import 'views/Home.dart';


main()=>runApp(MyApp());

class MyApp extends StatelessWidget {

   static var sideBarApp = SideBar("");

  @override
  Widget build(BuildContext context) {
    var router= AppRoute();
    return  MaterialApp.router(
      routerConfig: router.router,
    );
  }
}




