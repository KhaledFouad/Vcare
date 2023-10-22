import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare_app/core/errors/failures.dart';
import 'package:vcare_app/feature/home/data/models/specializations_model/doctor.dart';
import 'package:vcare_app/feature/search/data/repository/search_repository.dart';
import 'package:vcare_app/feature/search/presentation/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepository) : super(SearchInitialState());

  final SearchRepository searchRepository;

  static SearchCubit get(BuildContext context) => BlocProvider.of(context);

  TextEditingController searchController = TextEditingController();

  List<Doctor>? doctorsList = [];

  Future<void> getAllDoctors() async {
    emit(SearchLoadingState());
    Either<Failure, List<Doctor>> result;
    result = await searchRepository.getAllDoctor();
    result.fold((failure) {
      emit(SearchFailureState(failure.error));
    }, (doctorsList) {
      this.doctorsList = doctorsList;
      emit(SearchSuccessState(doctorsList));
    });
  }

  List<Doctor> searchedDoctorsList = [];

  void getSearchedDoctorsList({required String doctorName}) {
    searchedDoctorsList = doctorsList!.where((element) {
      return element.name!.toLowerCase().contains(doctorName.toLowerCase());
    }).toList();
    emit(GetSearchedDoctorsList());
  }
}
