import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare_app/core/errors/failures.dart';
import 'package:vcare_app/core/utils/app_constants.dart';
import 'package:vcare_app/feature/authentication/data/models/authentication_model/authentication_model.dart';
import 'package:vcare_app/feature/authentication/data/repository/authentication_repository.dart';
import 'package:vcare_app/feature/authentication/presentation/cubits/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authenticationRepository) : super(RegisterInitialState());

  final AuthenticationRepository authenticationRepository;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isShowConfirmPassword = true;
  bool isShowPassword = true;

  void changeConfirmPasswordVisibility() {
    isShowConfirmPassword = !isShowConfirmPassword;
    emit(RegisterChangeConfirmPasswordVisibilityState());
  }

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    emit(RegisterChangePasswordVisibilityState());
  }

  int gender = 0;

  void changeGroupValue({required int newValue}) {
    gender = newValue;
    emit(RegisterChangeGenderState());
  }

  AuthenticationModel? registerModel;

  Future<void> getToken({required String token}) async {
    AppConstants.token = token;
  }

  Future<void> userRegister() async {
    emit(RegisterLoadingState());
    Either<Failure, AuthenticationModel> result;
    result = await authenticationRepository.userRegister(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
      phone: phoneController.text,
      gender: gender.toString(),
    );
    result.fold((failure) {
      emit(RegisterFailureState(failure.error));
    }, (registerModel) {
      this.registerModel = registerModel;
      emit(RegisterSuccessState(registerModel));
    });
  }
}
