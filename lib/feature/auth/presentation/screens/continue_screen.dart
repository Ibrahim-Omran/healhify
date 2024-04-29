import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healhify/core/utils/app_assets.dart';
import 'package:healhify/core/utils/commons.dart';
import 'package:healhify/core/widget/custom_buttom.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widget/background_widget.dart';

class ContinueScreen extends StatelessWidget {
  const ContinueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BackGroundWidget(
          image: AppAssets.backGroundOne,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Image.asset(
                  AppAssets.appLogo,
                ),
                Text(
                  AppStrings.developedWith,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(
                  height: 100.h,
                ),
                Image.asset(
                  AppAssets.continueLogo,
                ),
                const Spacer(
                  flex: 3,
                ),
                CustomButton(
                  onPressed: () {
                    navigateReplacement(
                      context: context,
                      route: Routes.loginOrCreate,
                    );
                  },
                  text: AppStrings.continueToLogin,
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
