import 'package:flutter/material.dart';
import 'package:healhify/feature/auth/presentation/screens/forget_password_screen.dart';
import 'package:healhify/feature/auth/presentation/screens/login_or_create_screen.dart';
import 'package:healhify/feature/auth/presentation/screens/login_screen.dart';
import 'package:healhify/feature/auth/presentation/screens/sign_up_screen.dart';
import 'package:healhify/feature/home/presentation/screens/home_screen.dart';
import 'package:healhify/feature/home/presentation/screens/scan_screen.dart';

import '../../feature/auth/presentation/screens/continue_screen.dart';
import '../../feature/auth/presentation/screens/splash_screen.dart';


class Routes {
  static const String intitlRoute = '/';
  static const String login = '/login';
  static const String continueScreen = '/continueScreen';
  static const String loginOrCreate = '/loginOrCreate';
  static const String register = '/register';
  static const String forget = '/forget';
  static const String home = '/home';
  static const String scan = '/scan';





}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.intitlRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.continueScreen:
        return MaterialPageRoute(builder: (_) => const ContinueScreen());
      case Routes.loginOrCreate:
        return MaterialPageRoute(builder: (_) => const LoginOrCreateScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.forget:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.scan:
      // استخدم routeSettings.arguments للوصول إلى القيم التي تم تمريرها إلى الشاشة
        var arguments = routeSettings.arguments as Map<String, dynamic>?;

        // تحقق من وجود قيمة code في الـ arguments
        if (arguments != null && arguments.containsKey('title')&& arguments.containsKey('subTitle')&& arguments.containsKey('image')) {
          // قم بتحديد قيمة code وابعتها إلى ImageDetails) {
          // قم بتحديد قيمة code وابعتها إلى ImageDetails
          String title = arguments['title'];
          String subTitle = arguments['subTitle'];
          String image = arguments['image'];
          return MaterialPageRoute(
              builder: (_) => ScanScreen(title: title, subTitle: subTitle,image: image,));
        }



      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Not Found..!'),
            ),
          ),
        );
    }
  }
}
