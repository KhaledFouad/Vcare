

import 'package:vcare_app/feature/appointment/data/model/appointments_model/datum.dart';

abstract class BookAppointmentState {}

final class BookAppointmentInitial extends BookAppointmentState {}

class BookAppointmentLoadingState extends BookAppointmentState {}

class BookAppointmentSuccessState extends BookAppointmentState {
  final Appointment storeAppointmentModel;

  BookAppointmentSuccessState(this.storeAppointmentModel);
}

class BookAppointmentFailureState extends BookAppointmentState {
  final String error;

  BookAppointmentFailureState(this.error);
}


class ChangeIndexState extends BookAppointmentState{}