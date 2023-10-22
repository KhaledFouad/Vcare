import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare_app/core/utils/app_constants.dart';
import 'package:vcare_app/core/widgets/custom_error_widget.dart';
import 'package:vcare_app/core/widgets/loading_indicator_widget.dart';
import 'package:vcare_app/feature/home/presentation/cubits/get_random_specializations_cubit/get_random_specializations_cubit.dart';
import 'package:vcare_app/feature/home/presentation/cubits/get_random_specializations_cubit/get_random_specializations_state.dart';
import 'package:vcare_app/feature/home/presentation/views/widgets/specializations_list_view_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetRandomSpecializationsCubit,
        GetRandomSpecializationsState>(
      builder: (context, state) {
        if (state is GetRandomSpecializationsSuccessState) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(
              left: AppConstants.defaultPadding,
              right: AppConstants.defaultPadding,
              bottom: 70.h,
            ),
            itemBuilder: (context, index) => SpecializationsListViewItem(
                specializations: state.homeModel.data![index]),
            itemCount: GetRandomSpecializationsCubit.get(context)
                .specializationsModel!
                .data!
                .length,
          );
        } else if (state is GetRandomSpecializationsFailureState) {
          return CustomErrorWidget(error: state.error.toString());
        } else {
          return const Center(
            child: LoadingIndicatorWidget(),
          );
        }
      },
    );
  }
}
