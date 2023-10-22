import 'package:flutter/material.dart';
import 'package:vcare_app/core/utils/app_colors.dart';
import 'package:vcare_app/core/utils/app_styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    required this.controller,
    required this.onChange,
  }) : super(key: key);

  final TextEditingController controller;
  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 1,
      cursorColor: AppColors.white,
      //textInputAction: TextInputAction.search,
      onChanged: onChange,
      style: AppStyles.textStyle18.copyWith(color: AppColors.white),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Search',
        hintStyle: AppStyles.textStyle16.copyWith(color: AppColors.white),
      ),
    );
  }
}
