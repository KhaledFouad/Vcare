import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:vcare_app/config/icons/icons_broken.dart';
import 'package:vcare_app/feature/appointment/presentation/views/appointments_view.dart';
import 'package:vcare_app/feature/home/presentation/cubits/bottom_navigation_cubit/bottom_navigation_state.dart';
import 'package:vcare_app/feature/home/presentation/views/doctors_view.dart';
import 'package:vcare_app/feature/home/presentation/views/home_view.dart';
import 'package:vcare_app/feature/profile/presentation/views/profile_view.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationInitialState());

  static BottomNavigationCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeBottomNavigation(int index) {
    currentIndex = index;
    emit(ChangeBottomNavigationState());
  }

  List<Widget> bodyScreens = const [
    HomeView(),
    DoctorsView(),
    AppointmentsView(),
    ProfileView(),
  ];

  List<BottomNavigationBarItem> bottomNavigationBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Home,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Buy,
      ),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Profile,
      ),
      label: 'Profile',
    ),
  ];
}
