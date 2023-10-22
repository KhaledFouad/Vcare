import 'package:flutter/material.dart';
import 'package:vcare_app/core/utils/app_colors.dart';
import 'package:vcare_app/core/utils/app_constants.dart';
import 'package:vcare_app/core/utils/app_styles.dart';

class AppointmentDetailsWidget extends StatelessWidget {
  const AppointmentDetailsWidget(
      {Key? key,
        required this.bigTitle,
        required this.title1,
        required this.title2,
        required this.title3,
        required this.title4,
        required this.value1,
        required this.value2,
        required this.value3,
        required this.value4})
      : super(key: key);

  final String bigTitle;
  final String title1;
  final String title2;
  final String title3;
  final String title4;
  final String value1;
  final String value2;
  final String value3;
  final String value4;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          bigTitle,
          style: AppStyles.textStyle20.copyWith(
            color: AppColors.indigo,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: AppConstants.padding15h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title1,
              style: AppStyles.textStyle18,
            ),
            Expanded(
              child: Text(
                value1,
                textAlign: TextAlign.end,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.textStyle16.copyWith(
                  color: AppColors.grey,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: AppConstants.padding15h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title2,
              style: AppStyles.textStyle18,
            ),
            Expanded(
              child: Text(
                value2,
                textAlign: TextAlign.end,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.textStyle16.copyWith(
                  color: AppColors.grey,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: AppConstants.padding15h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title3,
              style: AppStyles.textStyle18,
            ),
            Text(
              value3,
              style: AppStyles.textStyle16.copyWith(
                color: AppColors.grey,
              ),
            ),
          ],
        ),
        SizedBox(
          height: AppConstants.padding15h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title4,
              style: AppStyles.textStyle18,
            ),
            Text(
              value4,
              style: AppStyles.textStyle16.copyWith(
                color: AppColors.grey,
              ),
            ),
          ],
        ),
        SizedBox(
          height: AppConstants.padding20h,
        ),
      ],
    );
  }
}