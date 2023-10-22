import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare_app/config/icons/icons_broken.dart';
import 'package:vcare_app/core/utils/app_colors.dart';
import 'package:vcare_app/core/utils/app_constants.dart';
import 'package:vcare_app/core/utils/app_styles.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({
    Key? key,
    required this.title,
    required this.content,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String content;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
        top: AppConstants.padding10h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.textStyle16.copyWith(
              color: AppColors.indigo,
            ),
          ),
          SizedBox(
            height: AppConstants.padding5h,
          ),
          Container(
            padding: EdgeInsets.all(AppConstants.padding5h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.radius8w),
              color: AppColors.grey50,
            ),
            width: MediaQuery.of(context).size.width,
            //height: 40.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    content,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppStyles.textStyle16.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ),
                InkWell(
                  onTap: onTap,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppConstants.radius5w),
                      color: Colors.white,
                    ),
                    width: 28.h,
                    height: 28.h,
                    child: Icon(
                      IconBroken.Edit,
                      color: AppColors.indigo,
                      size: AppConstants.iconSize24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}