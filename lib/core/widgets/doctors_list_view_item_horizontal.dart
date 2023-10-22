import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare_app/config/icons/icons_broken.dart';
import 'package:vcare_app/config/routes/app_routes.dart';
import 'package:vcare_app/core/utils/app_colors.dart';
import 'package:vcare_app/core/utils/app_constants.dart';
import 'package:vcare_app/core/utils/app_styles.dart';
import 'package:vcare_app/core/widgets/custom_network_image.dart';
import 'package:vcare_app/feature/home/data/models/specializations_model/doctor.dart';

class DoctorsListViewItemHorizontal extends StatelessWidget {
  const DoctorsListViewItemHorizontal({Key? key, required this.doctor})
      : super(key: key);

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.doctorDetailsView,
            arguments: doctor);
      },
      child: Container(
        padding: EdgeInsets.all(AppConstants.padding10h),
        width: double.infinity,
        height: 90.h,
        decoration: BoxDecoration(
          color: AppColors.grey50,
          borderRadius: BorderRadius.circular(AppConstants.radius10w),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: CustomNetworkImage(
                borderRadius: AppConstants.radius8w,
                image: doctor.photo!,
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: EdgeInsets.only(
                  left: AppConstants.padding10w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      doctor.name!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppStyles.textStyle18.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      doctor.specialization!.name!,
                      style:
                          AppStyles.textStyle15.copyWith(color: AppColors.grey),
                    ),
                    Row(
                      children: [
                        Icon(
                          IconBroken.Location,
                          color: AppColors.indigo,
                          size: AppConstants.iconSize20,
                        ),
                        Text(
                          doctor.city!.name!,
                          style: AppStyles.textStyle14,
                        ),
                        const Spacer(),
                        Text(
                          'EGP ${doctor.appointPrice}',
                          style: AppStyles.textStyle14.copyWith(
                            color: AppColors.indigo,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
