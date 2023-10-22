import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare_app/config/icons/icons_broken.dart';
import 'package:vcare_app/config/routes/app_routes.dart';
import 'package:vcare_app/core/utils/app_colors.dart';
import 'package:vcare_app/core/utils/app_constants.dart';
import 'package:vcare_app/core/utils/app_styles.dart';
import 'package:vcare_app/core/widgets/custom_network_image.dart';
import 'package:vcare_app/feature/home/data/models/specializations_model/doctor.dart';

class DoctorsListViewItem extends StatelessWidget {
  const DoctorsListViewItem({Key? key, required this.doctor}) : super(key: key);

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.doctorDetailsView,
            arguments: doctor);
      },
      borderRadius: BorderRadius.circular(AppConstants.radius10w),
      child: Container(
        width: 140.w,
        decoration: BoxDecoration(
          color: AppColors.grey50,
          borderRadius: BorderRadius.circular(AppConstants.radius10w),
        ),
        child: Padding(
          padding: EdgeInsets.all(AppConstants.padding8h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CustomNetworkImage(
                  borderRadius: AppConstants.radius8w,
                  image: doctor.photo!,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppConstants.padding3h),
                child: Text(
                  doctor.name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.textStyle16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                doctor.specialization!.name!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.textStyle16.copyWith(
                  color: AppColors.grey,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppConstants.padding3h),
                child: Row(
                  children: [
                    Icon(
                      IconBroken.Location,
                      color: AppColors.indigo,
                      size: AppConstants.iconSize18,
                    ),
                    Expanded(
                      child: Text(
                        doctor.city!.name!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.textStyle14,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'EGP ${doctor.appointPrice}',
                style: AppStyles.textStyle14.copyWith(
                  color: AppColors.indigo,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
