import 'package:flutter/material.dart';
import 'package:vcare_app/core/utils/app_constants.dart';
import 'package:vcare_app/core/widgets/doctors_list_view_item_horizontal.dart';
import 'package:vcare_app/feature/home/data/models/specializations_model/doctor.dart';

class SpecializationViewBody extends StatelessWidget {
  const SpecializationViewBody({Key? key, required this.doctors})
      : super(key: key);

  final List<Doctor> doctors;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.all(AppConstants.defaultPadding),
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        return DoctorsListViewItemHorizontal(doctor: doctors[index]);
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: AppConstants.padding10h,
        );
      },
    );
  }
}
