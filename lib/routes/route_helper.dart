import 'package:get/get.dart';

import '../module/view/home_screen.dart';
import '../module/view/login_screen.dart';

class RouteHelper {
  //static const String initial = "/";
  static const String login = "/login";
  static const String home = "/dashboard";

  static List<GetPage> routes = [
    //GetPage(name: initial, page: () => SplashScreen()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: home, page: () => HomeScreen()),
  ];
}
