import 'package:vcare_app/feature/home/data/models/specializations_model/specializations_model.dart';

abstract class GetRandomSpecializationsState {}

class GetRandomSpecializationsInitialState
    extends GetRandomSpecializationsState {}

class GetRandomSpecializationsLoadingState
    extends GetRandomSpecializationsState {}

class GetRandomSpecializationsSuccessState
    extends GetRandomSpecializationsState {
  final SpecializationsModel homeModel;

  GetRandomSpecializationsSuccessState(this.homeModel);
}

class GetRandomSpecializationsFailureState
    extends GetRandomSpecializationsState {
  final String error;

  GetRandomSpecializationsFailureState(this.error);
}
