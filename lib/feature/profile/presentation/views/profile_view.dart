import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare_app/config/local/cache_helper.dart';
import 'package:vcare_app/config/routes/app_routes.dart';
import 'package:vcare_app/core/utils/app_constants.dart';
import 'package:vcare_app/core/widgets/custom_error_widget.dart';
import 'package:vcare_app/core/widgets/gradient_button.dart';
import 'package:vcare_app/core/widgets/loading_indicator_widget.dart';
import 'package:vcare_app/feature/profile/presentation/cubits/get_user_profile_cubit.dart';
import 'package:vcare_app/feature/profile/presentation/cubits/get_user_profile_state.dart';
import 'package:vcare_app/feature/profile/presentation/views/widgets/image_user_profile.dart';
import 'package:vcare_app/feature/profile/presentation/views/widgets/name_and_email_user_profile.dart';
import 'package:vcare_app/feature/profile/presentation/views/widgets/profile_item_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserProfileCubit,GetUserProfileState>(
      builder: (context, state) {
        if(state is GetUserProfileSuccessState){
          return SingleChildScrollView(
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ImageUserProfile(),
                NameAndEmailUserProfile(
                  name: state.profileModel.data![0].name!,
                  email:  state.profileModel.data![0].email!,
                ),
                ProfileItemWidget(title: 'Name', content:  state.profileModel.data![0].name!, onTap: () {}),
                ProfileItemWidget(title: 'Email', content:  state.profileModel.data![0].email!, onTap: () {}),
                ProfileItemWidget(title: 'Phone', content:  state.profileModel.data![0].phone!, onTap: () {}),
                ProfileItemWidget(title: 'Gender', content:  state.profileModel.data![0].gender!, onTap: () {}),
                SizedBox(height: AppConstants.padding20h,),
                GradientButton(onPressed: (){
                  CacheHelper.removeData(key: 'token').then((value) {
                    Navigator.pushReplacementNamed(context, Routes.loginView);
                  });
                }, title: 'Logout',),
              ],
            ),
          );
        }else if (state is GetUserProfileFailureState){
          return CustomErrorWidget(error: state.error);
        }else{
          return const LoadingIndicatorWidget();
        }
      },
    );
  }
}


