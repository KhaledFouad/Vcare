import 'package:flutter/material.dart';
import 'package:vcare_app/core/utils/app_constants.dart';
import 'package:vcare_app/core/widgets/custom_back_button.dart';
import 'package:vcare_app/core/widgets/gradient_button.dart';
import 'package:vcare_app/feature/appointment/data/model/appointments_model/datum.dart';
import 'package:vcare_app/feature/appointment/presentation/views/widgets/appointment_details_view_body.dart';

class AppointmentDetailsView extends StatelessWidget {
  const AppointmentDetailsView({Key? key, required this.appointment})
      : super(key: key);

  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text(
          'Appointment Details',
        ),
      ),
      body: AppointmentDetailsViewBody(
        appointment: appointment,
      ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.all(AppConstants.defaultPadding),
        child: GradientButton(
          onPressed: () {},
          title: 'Print',
        ),
      ),
    );
  }
}
