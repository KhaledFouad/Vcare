import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare_app/feature/home/data/models/specializations_model/doctor.dart';
import 'package:vcare_app/feature/home/presentation/cubits/specialization_cubit/specialization_state.dart';

class SpecializationCubit extends Cubit<SpecializationState> {
  SpecializationCubit() : super(SpecializationInitialState());

  static SpecializationCubit get(BuildContext context) =>
      BlocProvider.of(context);

  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  List<Doctor> searchedDoctorsList = [];

  void getSearchedDoctorsList(
      {required String doctorName, required List<Doctor> doctors}) {
    searchedDoctorsList = doctors.where((element) {
      return element.name!.toLowerCase().contains(doctorName.toLowerCase());
    }).toList();
    emit(GetSearchedDoctorsList());
  }

  void startSearch(BuildContext context) {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearch));
    isSearching = true;
    emit(ChangeIsSearchingState());
  }

  void stopSearch() {
    _clearSearch();
    isSearching = false;
    emit(ChangeIsSearchingState());
  }

  void _clearSearch() {
    searchController.clear();
    emit(ChangeIsSearchingState());
  }
}
