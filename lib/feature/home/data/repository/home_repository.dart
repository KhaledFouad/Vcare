import 'package:dartz/dartz.dart';
import 'package:vcare_app/core/errors/failures.dart';
import 'package:vcare_app/feature/home/data/models/specializations_model/specializations_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, SpecializationsModel>> getRandomSpecializations();
  Future<Either<Failure, SpecializationsModel>> getAllSpecializations();
}
