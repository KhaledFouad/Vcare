import 'package:dartz/dartz.dart';
import 'package:vcare_app/core/errors/failures.dart';
import 'package:vcare_app/feature/appointment/data/model/appointments_model/appointments_model.dart';
import 'package:vcare_app/feature/appointment/data/model/appointments_model/datum.dart';

abstract class AppointmentRepository {
  Future<Either<Failure, AppointmentsModel>> getAppointments();
  Future<Either<Failure, Appointment>> bookAppointment({
    required String doctorId,
    required String startTime,
  });
}
