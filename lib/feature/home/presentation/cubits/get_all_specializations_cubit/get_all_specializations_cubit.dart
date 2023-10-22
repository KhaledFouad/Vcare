import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare_app/core/errors/failures.dart';
import 'package:vcare_app/feature/home/data/models/specializations_model/specializations_model.dart';
import 'package:vcare_app/feature/home/data/repository/home_repository.dart';
import 'package:vcare_app/feature/home/presentation/cubits/get_all_specializations_cubit/get_all_specializations_state.dart';

class GetAllSpecializationsCubit extends Cubit<GetAllSpecializationsState> {
  GetAllSpecializationsCubit(this.homeRepository)
      : super(GetAllSpecializationsInitialState());

  final HomeRepository homeRepository;

  static GetAllSpecializationsCubit get(context) => BlocProvider.of(context);

  SpecializationsModel? specializationsModel;

  Future<void> getAllSpecializations() async {
    emit(GetAllSpecializationsLoadingState());
    Either<Failure, SpecializationsModel> result;
    result = await homeRepository.getAllSpecializations();
    result.fold((failure) {
      emit(GetAllSpecializationsFailureState(failure.error));
    }, (specializationsModel) {
      this.specializationsModel = specializationsModel;
      emit(GetAllSpecializationsSuccessState(specializationsModel));
    });
  }
}
