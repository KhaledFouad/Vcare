import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare_app/config/icons/icons_broken.dart';
import 'package:vcare_app/config/local/cache_helper.dart';
import 'package:vcare_app/config/routes/app_routes.dart';
import 'package:vcare_app/core/animations/scale_transition_animation.dart';
import 'package:vcare_app/core/utils/app_colors.dart';
import 'package:vcare_app/feature/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:vcare_app/feature/onboarding/presentation/views/widgets/gradient_container_widget.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaleTransitionAnimation(
      duration: const Duration(seconds: 3),
      child: GradientContainerWidget(
        width: 80.h,
        height: 80.h,
        radius: 50.h,
        colors: AppColors.backgroundGradient,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        child: Center(
          child: Container(
            height: 75.h,
            width: 75.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.h),
              color: AppColors.white,
            ),
            child: Center(
              child: GradientContainerWidget(
                width: 65.h,
                height: 65.h,
                radius: 50.h,
                colors: AppColors.backgroundGradient,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    if (!OnBoardingCubit.get(context).isLast) {
                      OnBoardingCubit.get(context).pageController.nextPage(
                            duration: const Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.linearToEaseOut,
                          );
                    } else {
                      CacheHelper.setBoolean(key: 'onBoarding', value: true)
                          .then((value) {
                        Navigator.pushReplacementNamed(
                            context, Routes.loginView);
                      });
                    }
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.h),
                    ),
                  ),
                  child: Icon(
                    IconBroken.Arrow___Right,
                    color: AppColors.white,
                    size: 40.h,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
