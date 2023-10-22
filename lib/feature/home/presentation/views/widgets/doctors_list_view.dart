  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:vcare_app/core/utils/app_constants.dart';
  import 'package:vcare_app/feature/home/data/models/specializations_model/doctor.dart';
  import 'package:vcare_app/feature/home/presentation/views/widgets/doctors_list_view_item.dart';

  class DoctorsListView extends StatelessWidget {
    const DoctorsListView({Key? key, required this.doctors}) : super(key: key);

    final List<Doctor> doctors;

    @override
    Widget build(BuildContext context) {
      return SizedBox(
        height: 190.h,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              DoctorsListViewItem(doctor: doctors[index]),
          separatorBuilder: (context, index) => SizedBox(
            width: AppConstants.padding10w,
          ),
          itemCount: doctors.length,
        ),
      );
    }
  }
