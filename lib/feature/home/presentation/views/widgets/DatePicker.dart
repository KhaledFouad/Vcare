import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:vcare_app/feature/appointment/presentation/cubits/Book_Appointment/book_appointment_cubit.dart';
import 'package:vcare_app/feature/appointment/presentation/cubits/Book_Appointment/book_appointment_state.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
      builder: (context1, state) {
        return SizedBox(
          //height: MediaQuery.of(context).size.width / 3,
          child: Center(
            child: TextFormField(
              controller: BookAppointmentCubit.get(context).startTimeController,
              // Editing controller of this TextField
              validator: (value){
                if(value!.isEmpty){
                  return 'Please select date';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "yy/mm/dd",
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize:
                        18.sp), // Adjust the color and font size as needed
                // labelText: "Select date",
                // labelStyle: TextStyle(
                //   color: AppColors.black,
                //   fontSize: 16.sp,
                // ),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  BookAppointmentCubit.get(context).startTimeController.text=formattedDate;
                }
              },
            ),
          ),
        );
      },
    );
  }
}
