
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class ContainerComponent extends StatelessWidget {
  const ContainerComponent({
    super.key, required this.child, this.height,
  });

  final Widget child;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
