import 'package:go_router/go_router.dart';
import 'package:lean/views/Home.dart';
import 'package:lean/views/Login.dart';

// GoRouter configuration
class AppRoute{
  final _router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) =>  HomePage(username:state.extra.toString()),
      ),
    ],
  );
  get router => _router;
}