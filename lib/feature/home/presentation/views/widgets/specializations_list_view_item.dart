import 'package:flutter/material.dart';
import 'package:vcare_app/config/routes/app_routes.dart';
import 'package:vcare_app/core/utils/app_colors.dart';
import 'package:vcare_app/core/utils/app_strings.dart';
import 'package:vcare_app/core/utils/app_styles.dart';
import 'package:vcare_app/feature/home/data/models/specializations_model/data.dart';
import 'package:vcare_app/feature/home/presentation/views/widgets/doctors_list_view.dart';

class SpecializationsListViewItem extends StatelessWidget {
  const SpecializationsListViewItem({Key? key, required this.specializations})
      : super(key: key);

  final Data specializations;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              specializations.name!,
              style: AppStyles.textStyle18.copyWith(
                color: AppColors.indigo,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  Routes.specializationView,
                  arguments: specializations,
                );
              },
              child: Text(
                AppStrings.viewAll,
                style: AppStyles.textStyle16,
              ),
            ),
          ],
        ),
        DoctorsListView(doctors: specializations.doctors!)
      ],
    );
  }
}
