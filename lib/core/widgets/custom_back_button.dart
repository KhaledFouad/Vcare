import 'package:flutter/material.dart';
import 'package:vcare_app/config/icons/icons_broken.dart';
import 'package:vcare_app/core/utils/app_colors.dart';
import 'package:vcare_app/core/utils/app_constants.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key, this.color}) : super(key: key);
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        IconBroken.Arrow___Left_2,
        size: AppConstants.iconSize28,
        color: color ?? AppColors.white,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
