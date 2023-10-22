import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare_app/core/animations/slide_transition_animation.dart';
import 'package:vcare_app/core/utils/app_colors.dart';
import 'package:vcare_app/core/utils/app_styles.dart';
import 'package:vcare_app/feature/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:vcare_app/feature/onboarding/presentation/views/widgets/custom_button_widget.dart';
import 'package:vcare_app/feature/onboarding/presentation/views/widgets/onboarding_page_view.dart';
import 'package:vcare_app/feature/onboarding/presentation/views/widgets/page_indicator_widget.dart';

class ContainerDetailsWidget extends StatelessWidget {
  const ContainerDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideTransitionAnimation(
      duration: const Duration(milliseconds: 2500),
      begin: const Offset(0, 1),
      end: Offset.zero,
      curve: Curves.fastOutSlowIn,
      child: Container(
        padding: EdgeInsets.all(25.h),
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(30.h),
        ),
        child: Column(
          children: [
            PageIndicatorWidget(
              pageController: OnBoardingCubit.get(context).pageController,
              count: OnBoardingCubit.get(context).titles.length,
            ),
            Padding(
              padding: EdgeInsets.only(top: 25.h),
              child: Text(
                'VCare App',
                style: AppStyles.textStyle30.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
            const OnBoardingPageView(),
            const CustomButtonWidget(),
          ],
        ),
      ),
    );
  }
}
