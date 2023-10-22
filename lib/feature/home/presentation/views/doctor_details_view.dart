import 'package:flutter/material.dart';
import 'package:vcare_app/core/utils/app_colors.dart';
import 'package:vcare_app/feature/home/data/models/specializations_model/doctor.dart';
import 'package:vcare_app/feature/home/presentation/views/widgets/doctor_details_bottom_nav_bar.dart';
import 'package:vcare_app/feature/home/presentation/views/widgets/doctor_details_view_body.dart';


class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key, required this.doctor});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.deepPurple,
      body: DoctorDetailsViewBody(
        doctor: doctor,
      ),
      bottomNavigationBar: DoctorDetailBottomNavBar(
        doctor: doctor,
      ),
    );
  }
}

