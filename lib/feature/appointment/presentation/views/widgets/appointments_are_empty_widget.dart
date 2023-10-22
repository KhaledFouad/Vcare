import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vcare_app/core/utils/app_assets.dart';
import 'package:vcare_app/core/utils/app_constants.dart';
import 'package:vcare_app/core/utils/app_styles.dart';

class AppointmentsAreEmptyWidget extends StatelessWidget {
  const AppointmentsAreEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppConstants.defaultPadding,
        right: AppConstants.defaultPadding,
        bottom: 50.h,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.empty, height: 240.h),
            SizedBox(
              height: AppConstants.padding20h,
            ),
            Text(
              'Appointments are empty!',
              style: AppStyles.textStyle16,
            ),
          ],
        ),
      ),
    );
  }
}
