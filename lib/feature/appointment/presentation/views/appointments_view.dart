import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare_app/core/utils/app_constants.dart';
import 'package:vcare_app/core/widgets/custom_error_widget.dart';
import 'package:vcare_app/core/widgets/loading_indicator_widget.dart';
import 'package:vcare_app/feature/appointment/presentation/cubits/get_all_appointments_cubit/get_all_appointments_cubit.dart';
import 'package:vcare_app/feature/appointment/presentation/cubits/get_all_appointments_cubit/get_all_appointments_state.dart';
import 'package:vcare_app/feature/appointment/presentation/views/widgets/appointments_are_empty_widget.dart';
import 'package:vcare_app/feature/appointment/presentation/views/widgets/appointments_list_view_item.dart';

class AppointmentsView extends StatelessWidget {
  const AppointmentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllAppointmentCubit, GetAllAppointmentsState>(
      builder: (context, state) {
        if (state is GetAllAppointmentSuccessState) {
          if (state.appointmentModel.data!.isEmpty) {
            return const AppointmentsAreEmptyWidget();
          } else {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                left: AppConstants.defaultPadding,
                right: AppConstants.defaultPadding,
                top: AppConstants.defaultPadding,
                bottom: 70.h,
              ),
              itemCount: state.appointmentModel.data!.length,
              itemBuilder: (context, index) {
                return AppointmentsListViewItem(
                  appointment: state.appointmentModel.data![index],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: AppConstants.padding10h,
                );
              },
            );
          }
        } else if (state is GetAllAppointmentFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const LoadingIndicatorWidget();
        }
      },
    );
  }
}
