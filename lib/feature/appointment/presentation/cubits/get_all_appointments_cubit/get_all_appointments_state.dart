import 'package:vcare_app/feature/appointment/data/model/appointments_model/appointments_model.dart';

abstract class GetAllAppointmentsState {}

class GetAllAppointmentInitialState extends GetAllAppointmentsState {}

class GetAllAppointmentLoadingState extends GetAllAppointmentsState {}

class GetAllAppointmentSuccessState extends GetAllAppointmentsState {
  final AppointmentsModel appointmentModel;

  GetAllAppointmentSuccessState(this.appointmentModel);
}

class GetAllAppointmentFailureState extends GetAllAppointmentsState {
  final String error;

  GetAllAppointmentFailureState(this.error);
}
