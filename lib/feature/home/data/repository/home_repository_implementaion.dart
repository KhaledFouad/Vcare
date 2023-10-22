import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vcare_app/core/api/api_services.dart';
import 'package:vcare_app/core/api/end_points.dart';
import 'package:vcare_app/core/errors/failures.dart';
import 'package:vcare_app/core/utils/app_constants.dart';
import 'package:vcare_app/feature/home/data/models/specializations_model/specializations_model.dart';

import 'home_repository.dart';

class HomeRepositoryImplementation extends HomeRepository {
  final ApiServices apiServices;

  HomeRepositoryImplementation(this.apiServices);

  @override
  Future<Either<Failure, SpecializationsModel>>
      getRandomSpecializations() async {
    try {
      Response data = await apiServices.get(
        endPoint: EndPoints.getRandomSpecializations,
        token: AppConstants.token,
      );
      return Right(SpecializationsModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, SpecializationsModel>> getAllSpecializations() async {
    try {
      Response data = await apiServices.get(
        endPoint: EndPoints.getAllSpecializations,
        token: AppConstants.token,
      );
      return Right(SpecializationsModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
