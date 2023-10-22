import 'package:dartz/dartz.dart';
import 'package:vcare_app/core/errors/failures.dart';
import 'package:vcare_app/feature/home/data/models/specializations_model/doctor.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<Doctor>>> getAllDoctor();
}
