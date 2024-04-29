import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.height = 40,
    this.width = 180,
    required this.onPressed,
    this.background,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.colorSide = Colors.transparent,
    this.radius = 12.0,
  });

  final double? height;
  final double? width;
  final VoidCallback onPressed;
  final Color? background;
  final Color? colorSide ;
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height!.h,
      width: width!.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 2,
          backgroundColor: background ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side:  BorderSide(width: 3, color: colorSide!),

          ),
            ),
        child: FittedBox(
          child: Text(
            text,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: fontSize?.sp,
                  color: AppColors.white,
                  fontWeight: fontWeight,
                ),
          ),
        ),
      ),
    );
  }
}
