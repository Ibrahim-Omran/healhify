import 'package:flutter/material.dart';
import '../utils/app_colors.dart';


class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
     this.controller,
    this.hintText,
    this.labelText,
    this.validator,
    this.obscureText = false,
    this.iconSuffix,
    this.suffixIconOnPressed,
    this.keyboardType,
    this.readOnly = false,
    this.enabledBorder,
    this.focusedBorder,
    this.hintStyle,
    this.border,
    this.filled,
    this.fillColor,
    this.onChanged, this.colorCrsor,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final IconData? iconSuffix;
  final VoidCallback? suffixIconOnPressed;
  final TextInputType? keyboardType;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final TextStyle? hintStyle;
  final InputBorder? border;
  final bool? filled;
  final Color? fillColor;
  final Color? colorCrsor;
  final void Function(String)? onChanged;

  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.black,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      readOnly: readOnly,
      style: const TextStyle(
        color: AppColors.black,
      ),


      onChanged: onChanged,

      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        hintStyle: hintStyle,
        border: border,
        filled: filled,
        fillColor: fillColor,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,


        suffixIcon: IconButton(
          onPressed: suffixIconOnPressed,
          icon: Icon(
            iconSuffix,
            color:  AppColors.black,
          ),
        ),
      ),
    );
  }
}
