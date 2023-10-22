import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vcare_app/core/api/api_services.dart';
import 'package:vcare_app/core/api/end_points.dart';
import 'package:vcare_app/core/errors/failures.dart';
import 'package:vcare_app/core/utils/app_constants.dart';
import 'package:vcare_app/feature/profile/data/model/profile_model.dart';
import 'package:vcare_app/feature/profile/data/repositry/profile_repository.dart';

class ProfileRepositoryImplementation extends ProfileRepository {
  final ApiServices apiServices;

  ProfileRepositoryImplementation(this.apiServices);

  @override
  Future<Either<Failure, ProfileModel>> getUserProfile() async {
    try {
      Response data = await apiServices.get(
        endPoint: EndPoints.getUserProfile,
        token: AppConstants.token,
      );
      return Right(ProfileModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
