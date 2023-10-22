import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare_app/config/icons/icons_broken.dart';
import 'package:vcare_app/core/utils/app_constants.dart';
import 'package:vcare_app/core/widgets/custom_network_image.dart';
import 'package:vcare_app/feature/home/data/models/specializations_model/doctor.dart';

class DoctorDetailsViewBody extends StatelessWidget {
  const DoctorDetailsViewBody({Key? key, required this.doctor}) : super(key: key);

  final Doctor doctor ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Stack(
        children: [
          CustomNetworkImage(
            borderRadius: 0,
            image: doctor.photo!,
          ),
          Padding(
            padding:
            EdgeInsets.only(left: AppConstants.padding15h, top: 33.h),
            child: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.25),
              radius: AppConstants.radius19sp,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  IconBroken.Arrow___Left_2,
                  color: Colors.white,
                  size: AppConstants.iconSize23,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
