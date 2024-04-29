
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class ServicesComponent extends StatelessWidget {
  const ServicesComponent({
    super.key,
    required this.image, required this.title, this.onTap,
  });

  final String image ;
  final String title ;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120.w,
        height: 151.h,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(19),
          boxShadow: [
            BoxShadow(
                color: AppColors.black.withOpacity(.3),
                offset: const Offset(0, 0),
                blurRadius: 20,
                spreadRadius: 3)
          ],
        ),
        child:  Column(
          children: [
            Image.asset(image),
            const Spacer(),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: AppColors.blue,
              ),
            ),

            SizedBox(
              height: 15.h,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.sp),
              child: Container(
                width: double.infinity,
                height: 4,
                color: AppColors.primary,
              ),
            ),

            const Spacer(),

          ],
        ),
      ),
    );
  }
}
