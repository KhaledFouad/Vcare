import 'package:flutter/material.dart';
import 'package:vcare_app/config/routes/app_routes.dart';
import 'package:vcare_app/core/utils/app_colors.dart';
import 'package:vcare_app/core/utils/app_constants.dart';
import 'package:vcare_app/core/utils/app_styles.dart';
import 'package:vcare_app/feature/appointment/data/model/appointments_model/datum.dart';

class AppointmentsListViewItem extends StatelessWidget {
  const AppointmentsListViewItem({Key? key, required this.appointment})
      : super(key: key);

  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.appointmentDetailsView,
          arguments: appointment,
        );
      },
      child: Container(
        padding: EdgeInsets.all(AppConstants.padding10h),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.grey50,
          borderRadius: BorderRadius.circular(AppConstants.radius10w),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr: ${appointment.doctor!.name!}',
                    style: AppStyles.textStyle16,
                  ),
                  SizedBox(
                    height: AppConstants.padding5h,
                  ),
                  Text(
                    appointment.appointmentTime!,
                    style:
                        AppStyles.textStyle14.copyWith(color: AppColors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Text(
              appointment.status!,
              style: AppStyles.textStyle16.copyWith(
                color: AppColors.indigo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
