import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare_app/config/icons/icons_broken.dart';
import 'package:vcare_app/config/routes/app_routes.dart';
import 'package:vcare_app/core/utils/app_colors.dart';
import 'package:vcare_app/core/widgets/logout_icon_button_.dart';
import 'package:vcare_app/feature/appointment/presentation/cubits/get_all_appointments_cubit/get_all_appointments_cubit.dart';
import 'package:vcare_app/feature/home/presentation/cubits/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:vcare_app/feature/home/presentation/cubits/bottom_navigation_cubit/bottom_navigation_state.dart';
import 'package:vcare_app/feature/home/presentation/cubits/get_all_specializations_cubit/get_all_specializations_cubit.dart';
import 'package:vcare_app/feature/home/presentation/cubits/get_random_specializations_cubit/get_random_specializations_cubit.dart';
import 'package:vcare_app/feature/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:vcare_app/feature/profile/presentation/cubits/get_user_profile_cubit.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({Key? key}) : super(key: key);

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  @override
  void initState() {
    GetRandomSpecializationsCubit.get(context).getRandomSpecializations();
    GetAllSpecializationsCubit.get(context).getAllSpecializations();
    GetAllAppointmentCubit.get(context).getAllAppointments();
    GetUserProfileCubit.get(context).getUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (context, state) => Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: const LogoutIconButton(),
          title: const Text(
            'VCare',
          ),
        ),
        body: BottomNavigationCubit.get(context)
            .bodyScreens[BottomNavigationCubit.get(context).currentIndex],
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.indigo,
          onPressed: () {
            Navigator.pushNamed(context, Routes.searchView);
          },
          child: const Icon(IconBroken.Search),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
