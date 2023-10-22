import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare_app/core/errors/failures.dart';
import 'package:vcare_app/feature/appointment/data/model/appointments_model/appointments_model.dart';
import 'package:vcare_app/feature/appointment/data/repository/appointment_repository.dart';
import 'package:vcare_app/feature/appointment/presentation/cubits/get_all_appointments_cubit/get_all_appointments_state.dart';

class GetAllAppointmentCubit extends Cubit<GetAllAppointmentsState> {
  GetAllAppointmentCubit(this.appointmentRepository)
      : super(GetAllAppointmentInitialState());

  final AppointmentRepository appointmentRepository;

  static GetAllAppointmentCubit get(context) => BlocProvider.of(context);

  AppointmentsModel? appointmentsModel;

  Future<void> getAllAppointments() async {
    emit(GetAllAppointmentLoadingState());
    Either<Failure, AppointmentsModel> result;
    result = await appointmentRepository.getAppointments();
    result.fold((failure) {
      emit(GetAllAppointmentFailureState(failure.error));
    }, (appointmentsModel) {
      this.appointmentsModel = appointmentsModel;
      emit(GetAllAppointmentSuccessState(appointmentsModel));
    });
  }
}
