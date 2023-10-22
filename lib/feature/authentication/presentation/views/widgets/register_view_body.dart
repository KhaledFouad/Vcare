import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:vcare_app/config/routes/app_routes.dart';
import 'package:vcare_app/core/functions/show_snack_bar.dart';
import 'package:vcare_app/core/utils/app_constants.dart';
import 'package:vcare_app/core/utils/app_strings.dart';
import 'package:vcare_app/core/widgets/gradient_button.dart';
import 'package:vcare_app/core/widgets/title_and_subtitle.dart';
import 'package:vcare_app/feature/authentication/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:vcare_app/feature/authentication/presentation/cubits/register_cubit/register_state.dart';
import 'package:vcare_app/feature/authentication/presentation/views/widgets/nanigate_to_login_or_register.dart';
import 'package:vcare_app/feature/authentication/presentation/views/widgets/register_texts_fields_section.dart';
import 'package:vcare_app/feature/authentication/presentation/views/widgets/user_gender_group.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          AppConstants.token = state.authenticationModel.data!.token!;
          Navigator.pushNamed(context, Routes.layoutView);
          showSuccessSnackBar(
              context: context, message: state.authenticationModel.message!);
        } else if (state is RegisterFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is RegisterLoadingState,
          color: Colors.white,
          opacity: 0.5,
          progressIndicator: const CircularProgressIndicator(),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(AppConstants.defaultPadding),
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TitleAndSubtitle(
                        subtitle: AppStrings.registerSubtitle,
                        title: AppStrings.registerTitle,
                      ),
                      const RegisterTextsFieldsSection(),
                      const UserGenderGroup(),
                      NavigateToLoginOrRegister(
                        textTitle: 'Already have an account?',
                        buttonTitle: AppStrings.login,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      GradientButton(
                        title: AppStrings.register,
                        onPressed: () {
                          if (RegisterCubit.get(context)
                              .formKey
                              .currentState!
                              .validate()) {
                            RegisterCubit.get(context).userRegister();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
