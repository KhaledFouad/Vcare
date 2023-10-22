import 'package:flutter/material.dart';
import 'package:vcare_app/core/utils/app_colors.dart';
import 'package:vcare_app/core/utils/app_constants.dart';
import 'package:vcare_app/core/utils/app_styles.dart';

class NameAndEmailUserProfile extends StatelessWidget {
  const NameAndEmailUserProfile(
      {Key? key, required this.name, required this.email})
      : super(key: key);

  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: AppConstants.padding10h),
          child: Text(
            name,
            style: AppStyles.textStyle18,
          ),
        ),
        Text(
          email,
          style: AppStyles.textStyle15.copyWith(
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }
}