import 'package:flutter/material.dart';
import 'package:healhify/feature/auth/presentation/screens/forget_password_screen.dart';
import 'package:healhify/feature/auth/presentation/screens/login_or_create_screen.dart';
import 'package:healhify/feature/auth/presentation/screens/login_screen.dart';
import 'package:healhify/feature/auth/presentation/screens/sign_up_screen.dart';
import 'package:healhify/feature/home/presentation/screens/home_screen.dart';

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
