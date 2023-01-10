import 'package:lean/models/User.dart';

class LoginCtrl {
  LoginCtrl();

  static bool isDataCorrect(User user) => user.username == "admin" && user.password == "admin";
}
