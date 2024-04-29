
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widget/custom_text_form_field.dart';

class TextFormFieldComponent extends StatelessWidget {
  const TextFormFieldComponent({
    super.key, required this.hintText, this.controller, required this.icon, this.validator, this.obscureText = false,
  });

  final String hintText;
  final TextEditingController? controller;
  final IconData icon;
  final String? Function(String?)? validator;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 35.sp,
          color: AppColors.deepBlue,
        ),
        SizedBox(
          width: 20.w,
        ),
        Expanded(
          child: CustomTextFormField(
            controller: controller,
            hintText: hintText,
            validator: validator,
            obscureText: obscureText,
          ),
        ),
      ],
    );
  }
}
