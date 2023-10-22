import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare_app/core/errors/failures.dart';
import 'package:vcare_app/feature/profile/data/model/profile_model.dart';
import 'package:vcare_app/feature/profile/data/repositry/profile_repository.dart';
import 'package:vcare_app/feature/profile/presentation/cubits/get_user_profile_state.dart';

class GetUserProfileCubit extends Cubit<GetUserProfileState> {
  GetUserProfileCubit(this.profileRepository) : super(GetUserProfileInitialState());

  final ProfileRepository profileRepository;

  static GetUserProfileCubit get(context) => BlocProvider.of(context);

  ProfileModel? profileModel;

  Future<void> getUserProfile() async {
    emit(GetUserProfileLoadingState());
    Either<Failure, ProfileModel> result;
    result = await profileRepository.getUserProfile();
    result.fold((failure) {
      emit(GetUserProfileFailureState(failure.error));
    }, (profileModel) {
      this.profileModel = profileModel;
      emit(GetUserProfileSuccessState(profileModel));
    });
  }
}
