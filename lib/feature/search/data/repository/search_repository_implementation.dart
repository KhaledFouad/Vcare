import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vcare_app/core/api/api_services.dart';
import 'package:vcare_app/core/api/end_points.dart';
import 'package:vcare_app/core/errors/failures.dart';
import 'package:vcare_app/core/utils/app_constants.dart';
import 'package:vcare_app/feature/home/data/models/specializations_model/doctor.dart';
import 'package:vcare_app/feature/search/data/repository/search_repository.dart';

class SearchRepositoryImplementation extends SearchRepository {
  final ApiServices apiServices;

  SearchRepositoryImplementation(this.apiServices);

  @override
  Future<Either<Failure, List<Doctor>>> getAllDoctor() async {
    try {
      Response response = await apiServices.get(
        token: AppConstants.token,
        endPoint: EndPoints.getAllDoctors,
      );
      List<Doctor> doctors = (response.data['data'] as List<dynamic>)
          .map((e) => Doctor.fromJson(e as Map<String, dynamic>))
          .toList();
      return Right(doctors);
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message']));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
