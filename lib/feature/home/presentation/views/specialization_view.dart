import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare_app/config/icons/icons_broken.dart';
import 'package:vcare_app/core/utils/app_colors.dart';
import 'package:vcare_app/core/widgets/custom_back_button.dart';
import 'package:vcare_app/feature/home/data/models/specializations_model/data.dart';
import 'package:vcare_app/feature/home/presentation/cubits/specialization_cubit/specialization_cubit.dart';
import 'package:vcare_app/feature/home/presentation/cubits/specialization_cubit/specialization_state.dart';
import 'package:vcare_app/feature/home/presentation/views/widgets/specialization_view_body.dart';
import 'package:vcare_app/feature/search/presentation/views/widgets/search_text_field.dart';

class SpecializationView extends StatelessWidget {
  const SpecializationView({Key? key, required this.specialization})
      : super(key: key);

  final Data specialization;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecializationCubit, SpecializationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: const CustomBackButton(
            ),
            title: SpecializationCubit.get(context).isSearching
                ? SearchTextField(
                    controller:
                        SpecializationCubit.get(context).searchController,
                    onChange: (value) {
                      if (!value.startsWith(' ')) {
                        SpecializationCubit.get(context).getSearchedDoctorsList(
                          doctorName: value,
                          doctors: specialization.doctors!,
                        );
                      }
                    },
                  )
                : Text(specialization.name!),
            actions: [
              SpecializationCubit.get(context).isSearching
                  ? IconButton(
                      onPressed: () {
                        SpecializationCubit.get(context).stopSearch();
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.clear,
                        color: AppColors.white,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        SpecializationCubit.get(context).startSearch(context);
                      },
                      icon: const Icon(
                        IconBroken.Search,
                        color: AppColors.white,
                      ),
                    ),
            ],
          ),
          body: SpecializationViewBody(
            doctors: SpecializationCubit.get(context)
                    .searchController
                    .text
                    .isNotEmpty
                ? SpecializationCubit.get(context).searchedDoctorsList
                : specialization.doctors!,
          ),
        );
      },
    );
  }
}
