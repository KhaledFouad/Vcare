import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare_app/core/errors/failures.dart';
import 'package:vcare_app/feature/appointment/data/model/appointments_model/datum.dart';
import 'package:vcare_app/feature/appointment/data/repository/appointment_repository.dart';
import 'package:vcare_app/feature/appointment/presentation/cubits/Book_Appointment/book_appointment_state.dart';


class BookAppointmentCubit extends Cubit<BookAppointmentState> {
  BookAppointmentCubit(this.appointmentRepository)
      : super(BookAppointmentInitial());

  final AppointmentRepository appointmentRepository;

  TextEditingController startTimeController =
      TextEditingController();
  var formKey = GlobalKey<FormState>();

  String? hourForAppointment ='2:00 PM' ;

  int newIndex= 0;
  void changeIndex({required int index}){
    newIndex = index;
    emit(ChangeIndexState());
  }


  static BookAppointmentCubit get(context) => BlocProvider.of(context);

  Appointment? storeAppointmentModel;

  Future<void> storeAppointment({required String doctorId}) async {
    emit(BookAppointmentLoadingState());
    Either<Failure, Appointment> result;
    result = await appointmentRepository.bookAppointment(
        doctorId: doctorId, startTime:startTimeController.text+  hourForAppointment! );
    result.fold((failure) {
      emit(BookAppointmentFailureState(failure.error));
    }, (storeAppointmentModel) {
      this.storeAppointmentModel = storeAppointmentModel;
      emit(BookAppointmentSuccessState(storeAppointmentModel));
    });
  }
}
