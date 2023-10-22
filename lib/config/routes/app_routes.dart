import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare_app/core/animations/page_fade_transition.dart';
import 'package:vcare_app/core/animations/page_slide_transition.dart';
import 'package:vcare_app/core/api/api_services_implementation.dart';
import 'package:vcare_app/core/utils/app_strings.dart';
import 'package:vcare_app/feature/appointment/data/model/appointments_model/datum.dart';
import 'package:vcare_app/feature/appointment/data/repository/appointment_repository_implementation.dart';
import 'package:vcare_app/feature/appointment/presentation/cubits/Book_Appointment/book_appointment_cubit.dart';
import 'package:vcare_app/feature/appointment/presentation/cubits/get_all_appointments_cubit/get_all_appointments_cubit.dart';
import 'package:vcare_app/feature/appointment/presentation/views/appointment_details.dart';
import 'package:vcare_app/feature/authentication/data/repository/authentication_repository_implementation.dart';
import 'package:vcare_app/feature/authentication/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:vcare_app/feature/authentication/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:vcare_app/feature/authentication/presentation/views/login_view.dart';
import 'package:vcare_app/feature/authentication/presentation/views/register_view.dart';
import 'package:vcare_app/feature/home/data/models/specializations_model/data.dart';
import 'package:vcare_app/feature/home/data/models/specializations_model/doctor.dart';
import 'package:vcare_app/feature/home/data/repository/home_repository_implementaion.dart';
import 'package:vcare_app/feature/home/presentation/cubits/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:vcare_app/feature/home/presentation/cubits/get_all_specializations_cubit/get_all_specializations_cubit.dart';
import 'package:vcare_app/feature/home/presentation/cubits/get_random_specializations_cubit/get_random_specializations_cubit.dart';
import 'package:vcare_app/feature/home/presentation/cubits/specialization_cubit/specialization_cubit.dart';
import 'package:vcare_app/feature/home/presentation/views/specialization_view.dart';
import 'package:vcare_app/feature/home/presentation/views/doctor_details_view.dart';
import 'package:vcare_app/feature/home/presentation/views/layout_view.dart';
import 'package:vcare_app/feature/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:vcare_app/feature/onboarding/presentation/views/onboarding_view.dart';
import 'package:vcare_app/feature/profile/data/repositry/profile_repository_implementation.dart';
import 'package:vcare_app/feature/profile/presentation/cubits/get_user_profile_cubit.dart';
import 'package:vcare_app/feature/search/data/repository/search_repository_implementation.dart';
import 'package:vcare_app/feature/search/presentation/cubit/search_cubit.dart';
import 'package:vcare_app/feature/search/presentation/views/search_view.dart';
import 'package:vcare_app/feature/splash/presentation/views/splash_view.dart';

class Routes {
  static const String slashView = '/';
  static const String onBoardingView = '/onBoarding_view';
  static const String registerView = '/register_view';
  static const String loginView = '/login_view';
  static const String layoutView = '/layout_view';
  static const String doctorDetailsView = '/doctor_details_view';
  static const String specializationView = '/specialization_view';
  static const String searchView = '/search_view';
  static const String appointmentDetailsView = '/appointment_detail_view';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.slashView:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case Routes.onBoardingView:
        return PageFadeTransition(
          page: BlocProvider(
            create: (context) => OnBoardingCubit(),
            child: const OnBoardingView(),
          ),
        );
      case Routes.loginView:
        return PageFadeTransition(
          page: BlocProvider(
            create: (context) => LoginCubit(
                AuthenticationRepositoryImplementation(
                    ApiServicesImplementation())),
            child: const LoginView(),
          ),
        );
      case Routes.registerView:
        return PageSlideTransition(
          direction: AxisDirection.left,
          page: BlocProvider(
            create: (context) => RegisterCubit(
                AuthenticationRepositoryImplementation(
                    ApiServicesImplementation())),
            child: const RegisterView(),
          ),
        );
      case Routes.layoutView:
        return PageSlideTransition(
          direction: AxisDirection.left,
          page: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => BottomNavigationCubit(),
              ),
              BlocProvider(
                create: (context) => GetRandomSpecializationsCubit(
                    HomeRepositoryImplementation(ApiServicesImplementation())),
              ),
              BlocProvider(
                create: (context) => GetAllSpecializationsCubit(
                    HomeRepositoryImplementation(ApiServicesImplementation())),
              ),
              BlocProvider(
                create: (context) => GetAllAppointmentCubit(
                    AppointmentRepositoryImplementation(
                        ApiServicesImplementation())),
              ),
              BlocProvider(
                create: (context) => GetUserProfileCubit(
                    ProfileRepositoryImplementation(
                        ApiServicesImplementation())),
              ),
            ],
            child: const LayoutView(),
          ),
        );
      case Routes.doctorDetailsView:
        final doctor = settings.arguments as Doctor;
        return PageSlideTransition(
          page: BlocProvider(
              create: (context) => BookAppointmentCubit(
                  AppointmentRepositoryImplementation(
                      ApiServicesImplementation())),
              child: DoctorDetailsView(doctor: doctor)),
          direction: AxisDirection.left,
        );
      case Routes.searchView:
        return PageSlideTransition(
          page: BlocProvider(
              create: (context) => SearchCubit(
                  SearchRepositoryImplementation(ApiServicesImplementation())),
              child: const SearchView()),
          direction: AxisDirection.left,
        );
      case Routes.specializationView:
        final specialization = settings.arguments as Data;
        return PageSlideTransition(
          page: BlocProvider(
              create: (context) => SpecializationCubit(),
              child: SpecializationView(specialization: specialization)),
          direction: AxisDirection.left,
        );
      case Routes.appointmentDetailsView:
        final appointment = settings.arguments as Appointment;
        return PageSlideTransition(
          page: AppointmentDetailsView(appointment: appointment),
          direction: AxisDirection.left,
        );
    }
    return undefinedRoute();
  }

  static Route undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text(AppStrings.noRouteFound),
            ),
          )),
    );
  }
}
