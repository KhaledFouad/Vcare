import 'package:flutter/material.dart';
import 'package:vcare_app/config/icons/icons_broken.dart';
import 'package:vcare_app/config/local/cache_helper.dart';
import 'package:vcare_app/config/routes/app_routes.dart';
import 'package:vcare_app/core/utils/app_colors.dart';
import 'package:vcare_app/core/utils/app_constants.dart';

class LogoutIconButton extends StatelessWidget {
  const LogoutIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        CacheHelper.removeData(key: 'token').then((value) {
          Navigator.pushReplacementNamed(context, Routes.loginView);
        });
      },
      icon:  Icon(
        IconBroken.Logout,
        color: AppColors.white,
        size: AppConstants.iconSize28,
      ),
    );
  }
}