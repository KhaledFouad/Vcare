import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare_app/feature/onboarding/presentation/cubit/onboarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitialState());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  final PageController pageController = PageController();

  List<String> titles = [
    'Welcome to Vcare, Say goodbye to long waiting times.',
    'With Vcare you can easily schedule appointments with trusted doctors from your home.',
    'Our mission is to empower you to take control of your health journey.',
  ];

  bool isLast = false;

  void onChangePageView(int index) {
    if (index == titles.length - 1) {
      isLast = true;
      emit(OnChangePageViewState());
    } else {
      isLast = false;
      emit(OnChangePageViewState());
    }
  }
}
