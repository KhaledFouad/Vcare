import 'package:vcare_app/feature/home/data/models/specializations_model/specializations_model.dart';

abstract class GetAllSpecializationsState {}

class GetAllSpecializationsInitialState extends GetAllSpecializationsState {}

class GetAllSpecializationsLoadingState extends GetAllSpecializationsState {}

class GetAllSpecializationsSuccessState extends GetAllSpecializationsState {
  final SpecializationsModel homeModel;

  GetAllSpecializationsSuccessState(this.homeModel);
}

class GetAllSpecializationsFailureState extends GetAllSpecializationsState {
  final String error;

  GetAllSpecializationsFailureState(this.error);
}
