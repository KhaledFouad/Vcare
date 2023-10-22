import 'package:flutter/material.dart';
import 'package:vcare_app/core/utils/app_colors.dart';
import 'package:vcare_app/core/utils/app_styles.dart';

class NavigateToLoginOrRegister extends StatelessWidget {
  const NavigateToLoginOrRegister({
    Key? key,
    required this.textTitle,
    required this.buttonTitle,
    this.onPressed,
  }) : super(key: key);

  final String textTitle;
  final String buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          textTitle,
          style: AppStyles.textStyle14,
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.indigo,
          ),
          onPressed: onPressed,
          child: Text(
            buttonTitle,
            style: AppStyles.textStyle14.copyWith(
              color: AppColors.indigo,
            ),
          ),
        ),
      ],
    );
  }
}
