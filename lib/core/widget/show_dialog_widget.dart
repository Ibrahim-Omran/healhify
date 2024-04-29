import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healhify/core/utils/app_colors.dart';
import 'package:healhify/core/utils/app_strings.dart';
import '../../../../core/widget/custom_buttom.dart';

class ShowDialogWidget extends StatelessWidget {
  const ShowDialogWidget(
      {super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.blue,
      content: SizedBox(
        height: 60.h,
        child: Center(
          child: Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 20.sp,color: AppColors.white)),
        ),
      ),
      actions: [
        Center(
          child: CustomButton(
            radius: 50,
            background: AppColors.deepBlue,
            text: AppStrings.cancel,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
