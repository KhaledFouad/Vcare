import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare_app/core/utils/app_constants.dart';
import 'package:vcare_app/core/widgets/custom_error_widget.dart';
import 'package:vcare_app/core/widgets/doctors_list_view_item_horizontal.dart';
import 'package:vcare_app/core/widgets/loading_indicator_widget.dart';
import 'package:vcare_app/feature/search/presentation/cubit/search_cubit.dart';
import 'package:vcare_app/feature/search/presentation/cubit/search_state.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      if (state is SearchSuccessState || state is GetSearchedDoctorsList) {
        return ListView.separated(
          padding: EdgeInsets.all(AppConstants.defaultPadding),
          itemCount: SearchCubit.get(context).searchController.text.isEmpty
              ? SearchCubit.get(context).doctorsList!.length
              : SearchCubit.get(context).searchedDoctorsList.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => DoctorsListViewItemHorizontal(
            doctor: SearchCubit.get(context).searchController.text.isEmpty
                ? SearchCubit.get(context).doctorsList![index]
                : SearchCubit.get(context).searchedDoctorsList[index],
          ),
          separatorBuilder: (context, index) =>
              SizedBox(height: AppConstants.padding10h),
        );
      } else if (state is SearchFailureState) {
        return CustomErrorWidget(error: state.error);
      } else {
        return const LoadingIndicatorWidget();
      }
    });
  }
}
