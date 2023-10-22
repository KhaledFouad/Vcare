import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vcare_app/core/api/api_services.dart';
import 'package:vcare_app/core/api/end_points.dart';
import 'package:vcare_app/core/errors/failures.dart';
import 'package:vcare_app/feature/authentication/data/models/authentication_model/authentication_model.dart';
import 'package:vcare_app/feature/authentication/data/repository/authentication_repository.dart';

class AuthenticationRepositoryImplementation extends AuthenticationRepository {
  final ApiServices apiServices;

  AuthenticationRepositoryImplementation(this.apiServices);

  @override
  Future<Either<Failure, AuthenticationModel>> userRegister({
    required String email,
    required String password,
    required String confirmPassword,
    required String name,
    required String phone,
    required String gender,
  }) async {
    try {
      Response data =
          await apiServices.post(endPoint: EndPoints.register, data: {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
        'gender': gender,
        'password_confirmation': confirmPassword,
      });
      return Right(AuthenticationModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, AuthenticationModel>> userLogin({
    required String email,
    required String password,
  }) async {
    try {
      Response data = await apiServices.post(endPoint: EndPoints.login, data: {
        'email': email,
        'password': password,
      });
      return Right(AuthenticationModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message']));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
