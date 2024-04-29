import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

TextStyle _textStyle({
  required Color color,
  required double fontSize,
  required FontWeight fontWeight,
}) {
  return TextStyle(
    color: color,
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
  );
}

TextStyle textStyleTwo({
  required Color color,
  required double fontSize,
  required FontWeight fontWeight,
}) {
  return TextStyle(
    color: color,
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
  );
}

// bold style
TextStyle boldStyle({
  Color color = AppColors.deepBlue,
  double fontSize = 22,
}) =>
    _textStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    );


// regular style
TextStyle regularStyle({
  Color color = AppColors.primary,
  double fontSize = 15,
}) =>
    _textStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
    );

TextStyle regularStyleTwo({
  Color color = AppColors.black,
  double fontSize = 16,
}) =>
    textStyleTwo(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
    );
