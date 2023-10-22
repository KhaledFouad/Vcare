import 'package:flutter/material.dart';
import 'package:vcare_app/core/utils/app_constants.dart';
import 'package:vcare_app/feature/appointment/data/model/appointments_model/datum.dart';
import 'package:vcare_app/feature/appointment/presentation/views/widgets/appointment_details_widget.dart';

class AppointmentDetailsViewBody extends StatelessWidget {
  const AppointmentDetailsViewBody({Key? key, required this.appointment})
      : super(key: key);

  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppointmentDetailsWidget(
            bigTitle: 'Doctor Details',
            title1: 'Name',
            title2: 'Email',
            title3: 'Phone',
            title4: 'Address',
            value1: appointment.doctor!.name!,
            value2: appointment.doctor!.email!,
            value3: appointment.doctor!.phone!,
            value4:
            '${appointment.doctor!.city!.name!}, ${appointment.doctor!.city!.governrate!.name!}',
          ),
          AppointmentDetailsWidget(
            bigTitle: 'Patient Details',
            title1: 'Name',
            title2: 'Email',
            title3: 'Phone',
            title4: 'Gender',
            value1: appointment.patient!.name!,
            value2: appointment.patient!.email!,
            value3: appointment.patient!.phone!,
            value4: appointment.patient!.gender!,
          ),
          AppointmentDetailsWidget(
            bigTitle: 'Appointment Details',
            title1: 'Start',
            title2: 'End',
            title3: 'Status',
            title4: 'Total Price',
            value1: appointment.appointmentTime!,
            value2: appointment.appointmentEndTime!,
            value3: appointment.status!,
            value4: 'EGP ${appointment.appointmentPrice.toString()}',
          ),
        ],
      ),
    );
  }
}