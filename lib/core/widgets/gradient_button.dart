import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare_app/core/utils/app_colors.dart';
import 'package:vcare_app/core/utils/app_styles.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.radius,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String title;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: MediaQuery.of(context).size.width,
      height: 45.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 8.w),
          gradient: const LinearGradient(
            colors: AppColors.indigoGradient,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          )),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: AppStyles.textStyle16.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
