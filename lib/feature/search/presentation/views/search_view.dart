import 'package:flutter/material.dart';
import 'package:vcare_app/config/icons/icons_broken.dart';
import 'package:vcare_app/core/utils/app_colors.dart';
import 'package:vcare_app/core/utils/app_constants.dart';
import 'package:vcare_app/core/widgets/custom_back_button.dart';
import 'package:vcare_app/feature/search/presentation/cubit/search_cubit.dart';
import 'package:vcare_app/feature/search/presentation/views/widgets/search_text_field.dart';
import 'package:vcare_app/feature/search/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    SearchCubit.get(context).getAllDoctors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.indigo,
        leading: const CustomBackButton(
        ),
        title: SearchTextField(
          controller: SearchCubit.get(context).searchController,
          onChange: (value) {
            if (!value.startsWith(' ')) {
              SearchCubit.get(context)
                  .getSearchedDoctorsList(doctorName: value);
            }
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: AppConstants.defaultPadding),
            child: const Icon(IconBroken.Search),
          )
        ],
      ),
      body: const SearchViewBody(),
    );
  }
}
