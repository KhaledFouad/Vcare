import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare_app/core/functions/show_snack_bar.dart';
import 'package:vcare_app/core/utils/app_colors.dart';
import 'package:vcare_app/core/utils/app_constants.dart';
import 'package:vcare_app/core/widgets/gradient_button.dart';
import 'package:vcare_app/feature/appointment/presentation/cubits/Book_Appointment/book_appointment_cubit.dart';
import 'package:vcare_app/feature/appointment/presentation/cubits/Book_Appointment/book_appointment_state.dart';
import 'package:vcare_app/feature/home/data/models/specializations_model/doctor.dart';
import 'package:vcare_app/feature/home/presentation/views/widgets/DatePicker.dart';
import 'package:vcare_app/feature/home/presentation/views/widgets/time_card_widget.dart';

class DoctorDetailBottomNavBar extends StatelessWidget {
  const DoctorDetailBottomNavBar({Key? key, required this.doctor})
      : super(key: key);

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookAppointmentCubit, BookAppointmentState>(
      listener: (context, state) {
        if (state is BookAppointmentSuccessState) {
          showSuccessSnackBar(
              context: context, message: "Created Successfully");
        } else if (state is BookAppointmentFailureState) {
          showErrorSnackBar(context: context, message: "Unprocessable Entity");
        }
      },
      builder: (BuildContext context, state) {
        return Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 1.45,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.w),
                topRight: Radius.circular(25.w)),
          ),
          child: Padding(
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                state is BookAppointmentLoadingState
                    ? const LinearProgressIndicator()
                    : const SizedBox(),
                Text(
                  doctor.name!,
                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 17.h,
                ),
                Text(
                  doctor.description!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 11.h,
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  decoration: const BoxDecoration(
                    color: Color(0x4c020d18),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Form(
                  key: BookAppointmentCubit.get(context).formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select date",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const CustomDatePicker(),
                      SizedBox(
                        height: 18.h,
                      ),
                      Text(
                        "Select time",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        height: 35,
                        child: TimeCard(
                          startTime: doctor.startTime!,
                          endTime: doctor.endTime!,
                        ),
                      ),
                      SizedBox(
                        height: 33.h,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                GradientButton(
                    onPressed: () {
                      if (BookAppointmentCubit.get(context)
                          .formKey
                          .currentState!
                          .validate()) {
                        BookAppointmentCubit.get(context)
                            .storeAppointment(doctorId: doctor.id.toString()).then((value){
                              Navigator.pop(context);
                        });
                      }
                    },
                    title: "Book An Appointment"),
              ],
            ),
          ),
        );
      },
    );
  }
}
