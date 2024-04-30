import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class UserDataComponent extends StatelessWidget {
  const UserDataComponent({
    super.key, required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: FittedBox(
          child: Text(
            text,
            style: Theme.of(context).textTheme
                .displayMedium!
                .copyWith(color: Colors.white,fontSize: 16,),
          ),
        ),
      ),
    );
  }
}
