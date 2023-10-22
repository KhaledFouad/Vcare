import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare_app/config/icons/icons_broken.dart';
import 'package:vcare_app/core/utils/app_colors.dart';
import 'package:vcare_app/core/widgets/custom_text_field.dart';
import 'package:vcare_app/feature/authentication/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:vcare_app/feature/authentication/presentation/cubits/register_cubit/register_state.dart';

class RegisterTextsFieldsSection extends StatelessWidget {
  const RegisterTextsFieldsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Form(
          key: RegisterCubit.get(context).formKey,
          child: Column(
            children: [
              CustomTextField(
                textInputType: TextInputType.name,
                controller: RegisterCubit.get(context).nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                title: 'Name',
                hintText: 'Enter your name',
              ),
              CustomTextField(
                textInputType: TextInputType.emailAddress,
                controller: RegisterCubit.get(context).emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                title: 'Email',
                hintText: 'Enter your email',
              ),
              CustomTextField(
                textInputType: TextInputType.visiblePassword,
                controller: RegisterCubit.get(context).passwordController,
                obscureText: RegisterCubit.get(context).isShowPassword,
                suffixIcon: InkWell(
                  onTap: () {
                    RegisterCubit.get(context).changePasswordVisibility();
                  },
                  child: Icon(
                    RegisterCubit.get(context).isShowPassword
                        ? IconBroken.Hide
                        : IconBroken.Show,
                    color: AppColors.grey,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 8) {
                    return 'Password is too short';
                  }
                  return null;
                },
                title: 'Password',
                hintText: 'Enter your password',
              ),
              CustomTextField(
                textInputType: TextInputType.visiblePassword,
                controller:
                    RegisterCubit.get(context).confirmPasswordController,
                obscureText: RegisterCubit.get(context).isShowConfirmPassword,
                suffixIcon: InkWell(
                  onTap: () {
                    RegisterCubit.get(context)
                        .changeConfirmPasswordVisibility();
                  },
                  child: Icon(
                    RegisterCubit.get(context).isShowConfirmPassword
                        ? IconBroken.Hide
                        : IconBroken.Show,
                    color: AppColors.grey,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your confirm password';
                  } else if (RegisterCubit.get(context)
                          .passwordController
                          .text !=
                      RegisterCubit.get(context)
                          .confirmPasswordController
                          .text) {
                    return 'password didn\'t matched';
                  }
                  return null;
                },
                title: 'Confirm Password',
                hintText: 'Enter your confirm password',
              ),
              CustomTextField(
                textInputType: TextInputType.phone,
                controller: RegisterCubit.get(context).phoneController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone';
                  }
                  return null;
                },
                title: 'Phone',
                hintText: 'Enter your phone',
                maxLength: 11,
                paddingForBottom: 0,
              ),
            ],
          ),
        );
      },
    );
  }
}
