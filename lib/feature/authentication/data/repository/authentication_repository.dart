import 'package:dartz/dartz.dart';
import 'package:vcare_app/core/errors/failures.dart';
import 'package:vcare_app/feature/authentication/data/models/authentication_model/authentication_model.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, AuthenticationModel>> userRegister({
    required String email,
    required String password,
    required String confirmPassword,
    required String name,
    required String phone,
    required String gender,
  });
  Future<Either<Failure, AuthenticationModel>> userLogin({
    required String email,
    required String password,
  });
}
