import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare_app/config/icons/icons_broken.dart';
import 'package:vcare_app/core/utils/app_colors.dart';
import 'package:vcare_app/core/utils/app_constants.dart';
import 'package:vcare_app/feature/appointment/presentation/cubits/get_all_appointments_cubit/get_all_appointments_cubit.dart';
import 'package:vcare_app/feature/home/presentation/cubits/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:vcare_app/feature/home/presentation/cubits/bottom_navigation_cubit/bottom_navigation_state.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (context, state) {
        return BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.w,
          child: SizedBox(
            height: 55.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    BottomNavigationCubit.get(context)
                        .changeBottomNavigation(0);
                  },
                  icon: Icon(
                    IconBroken.Home,
                    color: BottomNavigationCubit.get(context).currentIndex == 0
                        ? AppColors.indigo
                        : AppColors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    BottomNavigationCubit.get(context)
                        .changeBottomNavigation(1);
                  },
                  icon: Icon(
                    IconBroken.Plus,
                    color: BottomNavigationCubit.get(context).currentIndex == 1
                        ? AppColors.indigo
                        : AppColors.grey,
                  ),
                ),
                SizedBox(width: AppConstants.padding10w),
                IconButton(
                  onPressed: () {
                    BottomNavigationCubit.get(context)
                        .changeBottomNavigation(2);
                    GetAllAppointmentCubit.get(context).getAllAppointments();
                  },
                  icon: Icon(
                    IconBroken.Time_Circle,
                    color: BottomNavigationCubit.get(context).currentIndex == 2
                        ? AppColors.indigo
                        : AppColors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    BottomNavigationCubit.get(context)
                        .changeBottomNavigation(3);
                  },
                  icon: Icon(
                    IconBroken.Profile,
                    color: BottomNavigationCubit.get(context).currentIndex == 3
                        ? AppColors.indigo
                        : AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
