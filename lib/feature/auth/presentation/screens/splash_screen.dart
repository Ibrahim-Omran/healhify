import 'package:flutter/material.dart';
import 'package:healhify/core/utils/app_assets.dart';
import 'package:healhify/core/utils/app_colors.dart';

import '../../../../core/cache/cache_helper.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/service/service_locator.dart';
import '../../../../core/utils/commons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateAfterThreeSeconds();
    super.initState();
  }

  // wait some time and navigate to login screen
  void navigateAfterThreeSeconds() {
    bool isVisited =
        sl<CacheHelper>().getData(key: 'loginKey') ?? false;


    Future.delayed(const Duration(seconds: 2), () {
      navigateReplacement(
        context: context,
        route: isVisited ? Routes.home : Routes.continueScreen ,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepBlue,
      body: Center(
        child: Image.asset(AppAssets.logo),
      ),
    );
  }
}
