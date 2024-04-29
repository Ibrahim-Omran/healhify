import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healhify/core/utils/app_assets.dart';
import 'package:healhify/core/utils/app_colors.dart';
import 'package:healhify/core/utils/commons.dart';
import 'package:healhify/core/widget/custom_buttom.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widget/background_widget.dart';

class LoginOrCreateScreen extends StatelessWidget {
  const LoginOrCreateScreen({super.key});

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
                  AppStrings.rightApp,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const Spacer(
                  flex: 4,
                ),
                CustomButton(
                  onPressed: () {
                    navigate(
                      context: context,
                      route: Routes.login,
                    );
                  },
                  text: AppStrings.login,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomButton(
                  background: Colors.transparent,
                  colorSide: AppColors.primary,
                  fontSize: 18,
                  onPressed: () {
                    navigate(
                      context: context,
                      route: Routes.register,
                    );
                  },
                  text: AppStrings.createAccount,
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
