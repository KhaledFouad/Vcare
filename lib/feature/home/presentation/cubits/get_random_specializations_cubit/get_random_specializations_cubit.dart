import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare_app/core/errors/failures.dart';
import 'package:vcare_app/feature/home/data/models/specializations_model/specializations_model.dart';
import 'package:vcare_app/feature/home/data/repository/home_repository.dart';
import 'package:vcare_app/feature/home/presentation/cubits/get_random_specializations_cubit/get_random_specializations_state.dart';

class GetRandomSpecializationsCubit
    extends Cubit<GetRandomSpecializationsState> {
  GetRandomSpecializationsCubit(this.homeRepository)
      : super(GetRandomSpecializationsInitialState());

  final HomeRepository homeRepository;

  static GetRandomSpecializationsCubit get(context) => BlocProvider.of(context);

  SpecializationsModel? specializationsModel;

  Future<void> getRandomSpecializations() async {
    emit(GetRandomSpecializationsLoadingState());
    Either<Failure, SpecializationsModel> result;
    result = await homeRepository.getRandomSpecializations();
    result.fold((failure) {
      emit(GetRandomSpecializationsFailureState(failure.error));
    }, (specializationsModel) {
      this.specializationsModel = specializationsModel;
      emit(GetRandomSpecializationsSuccessState(specializationsModel));
    });
  }
}
