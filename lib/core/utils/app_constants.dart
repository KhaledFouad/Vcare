import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppConstants {
  static String token = '';
  static const String path = 'assets/images/';
  static final double defaultPadding = 12.h;
  static final double defaultPaddingW = 12.w;
  static final double padding15h = 15.h;
  static final double padding50h = 50.h;
  static final double padding45h = 45.h;
  static final double padding10h = 10.h;
  static final double padding20h = 20.h;
  static final double padding10w = 10.w;
  static final double padding8w = 8.w;
  static final double padding15w = 15.w;
  static final double padding5w = 5.w;
  static final double padding3w = 3.w;
  static final double padding8h = 8.h;
  static final double padding5h = 5.h;
  static final double padding3h = 3.h;
  static final double radius15w = 15.w;
  static final double radius8w = 8.w;
  static final double radius10w = 10.w;
  static final double radius5w = 5.w;
  static final double radius30sp = 30.sp;
  static final double radius19sp = 19.sp;
  static final double radius28sp = 28.sp;
  static final double iconSize24 = 24.sp;
  static final double iconSize23 = 23.sp;
  static final double iconSize18 = 18.sp;
  static final double iconSize28 = 28.sp;
  static final double iconSize33 = 33.sp;
  static final double iconSize22 = 22.sp;
  static final double iconSize20 = 20.sp;
  static final double circularSize22 = 22.sp;

  static final OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius8w),
    borderSide: BorderSide(
      width: 1.1.w,
      color: AppColors.indigo,
    ),
  );

  static final OutlineInputBorder enabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius8w),
    borderSide: BorderSide.none,
  );

  static const SystemUiOverlayStyle systemUiOverlayStyleLight =
      SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.light,
    statusBarColor: AppColors.transparent,
  );
  static const SystemUiOverlayStyle systemUiOverlayStyleDark =
      SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  );
}
