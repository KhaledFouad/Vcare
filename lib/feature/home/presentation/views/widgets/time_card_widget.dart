import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare_app/core/utils/app_colors.dart';
import 'package:vcare_app/core/utils/app_constants.dart';
import 'package:vcare_app/core/utils/app_styles.dart';
import 'package:vcare_app/feature/appointment/presentation/cubits/Book_Appointment/book_appointment_cubit.dart';
import 'package:vcare_app/feature/appointment/presentation/cubits/Book_Appointment/book_appointment_state.dart';

class TimeCard extends StatefulWidget {
  final String startTime;
  final String endTime;

  const TimeCard({super.key, required this.startTime, required this.endTime});

  @override
  State<TimeCard> createState() => _TimeCardState();
}

class _TimeCardState extends State<TimeCard> {
  List<String> generateHours(
      String startTimeStr, String endTimeStr, BuildContext context) {
    TimeOfDay startTime = TimeOfDay(
      hour: int.parse(startTimeStr.split(':')[0]),
      minute: int.parse(startTimeStr.split(':')[1]),
    );

    TimeOfDay endTime = TimeOfDay(
      hour: int.parse(endTimeStr.split(':')[0]),
      minute: int.parse(endTimeStr.split(':')[1]),
    );

    List<String> hoursList = [
      startTime.format(context)
    ]; // Start time is included

    while (startTime != endTime) {
      int newHour = startTime.hour;
      int newMinute = startTime.minute + 30; // Increase by 30 minutes

      if (newMinute >= 60) {
        newHour += 1;
        newMinute -= 60;
      }

      startTime = TimeOfDay(hour: newHour, minute: newMinute);

      if (startTime == endTime) {
        break; // End time reached, exit the loop
      }

      hoursList.add(startTime.format(context));
    }

    return hoursList;
  }



  @override
  Widget build(BuildContext context) {
    List<String> hoursWithinRange =
        generateHours(widget.startTime, widget.endTime, context);
    return BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
      builder: (context, state) {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                BookAppointmentCubit.get(context).changeIndex(index: index);
                BookAppointmentCubit.get(context).hourForAppointment =
                    hoursWithinRange[index];
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.sp),
                height: 30.h,
                width: 90.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: BookAppointmentCubit.get(context).newIndex == index
                      ? AppColors.indigo
                      : AppColors.grey50,
                ),
                child: Center(
                  child: Text(
                    hoursWithinRange[index],
                    style: AppStyles.textStyle16.copyWith(
                      color: BookAppointmentCubit.get(context).newIndex == index
                          ? AppColors.white
                          : AppColors.black,
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: AppConstants.padding10w,
            );
          },
          itemCount: hoursWithinRange.length,
        );
      },
    );
  }
}
