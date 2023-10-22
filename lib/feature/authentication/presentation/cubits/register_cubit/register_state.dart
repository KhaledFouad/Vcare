import 'package:vcare_app/feature/authentication/data/models/authentication_model/authentication_model.dart';

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final AuthenticationModel authenticationModel;

  RegisterSuccessState(this.authenticationModel);
}

class RegisterFailureState extends RegisterState {
  final String error;

  RegisterFailureState(this.error);
}

class RegisterChangePasswordVisibilityState extends RegisterState {}

class RegisterChangeConfirmPasswordVisibilityState extends RegisterState {}

class RegisterChangeGenderState extends RegisterState {}
