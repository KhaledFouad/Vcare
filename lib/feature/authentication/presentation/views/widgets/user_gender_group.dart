import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare_app/core/utils/app_styles.dart';
import 'package:vcare_app/feature/authentication/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:vcare_app/feature/authentication/presentation/cubits/register_cubit/register_state.dart';

class UserGenderGroup extends StatelessWidget {
  const UserGenderGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RadioMenuButton(
              value: 0,
              groupValue: RegisterCubit.get(context).gender,
              onChanged: (value) {
                RegisterCubit.get(context).changeGroupValue(newValue: value!);
              },
              child: Text(
                'Male',
                style: AppStyles.textStyle14,
              ),
            ),
            RadioMenuButton(
              value: 1,
              groupValue: RegisterCubit.get(context).gender,
              child: Text(
                'Female',
                style: AppStyles.textStyle14,
              ),
              onChanged: (value) {
                RegisterCubit.get(context).changeGroupValue(newValue: value!);
              },
            ),
          ],
        );
      },
    );
  }
}
