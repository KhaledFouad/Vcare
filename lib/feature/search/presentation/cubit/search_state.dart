import 'package:vcare_app/feature/home/data/models/specializations_model/doctor.dart';

abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchFailureState extends SearchState {
  final String error;
  SearchFailureState(this.error);
}

class SearchSuccessState extends SearchState {
  final List<Doctor> doctors;

  SearchSuccessState(this.doctors);
}

class GetSearchedDoctorsList extends SearchState {}
