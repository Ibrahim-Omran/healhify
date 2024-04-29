import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healhify/feature/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:healhify/feature/auth/presentation/cubits/sign_up_cubit/sign_up_state.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/commons.dart';
import '../../../../core/widget/back_widget.dart';
import '../../../../core/widget/background_widget.dart';
import '../../../../core/widget/custom_buttom.dart';
import '../../../../core/widget/show_dialog_widget.dart';
import '../../../../core/widget/container_component.dart';
import '../component/text_form_field_component.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BackGroundWidget(
          image: AppAssets.backGroundOne,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BackWidget(),
                  SizedBox(
                    height: 140.h,
                  ),
                  BlocConsumer<SignUpCubit, SignUpState>(
                      listener: (context, state) {
                    if (state is ErrorState) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return ShowDialogWidget(
                            title: state.errorMS,
                          );
                        },
                      );
                    } else if (state is SuccessState) {
                      showSnackBar(context, 'Register Success', Colors.green);
                      navigateReplacement(
                          context: context, route: Routes.login);
                    }
                  }, builder: (context, state) {
                    final cubit = BlocProvider.of<SignUpCubit>(context);
                    return Form(
                      key: cubit.signUpKey,
                      child: state is LoadingState
                          ? const Center(child: CircularProgressIndicator())
                          : ContainerComponent(
                              height: 400.h,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                     TextFormFieldComponent(
                                       controller: cubit.nameController,
                                      hintText: AppStrings.userName,
                                      icon: Icons.person_outline,
                                       validator: (data) {
                                         if (data!.isEmpty) {
                                           return "Enter Your Name";
                                         }
                                         return null;
                                       },
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                     TextFormFieldComponent(
                                      controller: cubit.emailController,
                                      hintText: AppStrings.email,
                                      icon: Icons.email_outlined,
                                       validator: (data) {
                                         if (data!.isEmpty ||
                                             !data.contains('@gmail.com')) {
                                           return "Enter Your Email";
                                         }
                                         return null;
                                       },
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                     TextFormFieldComponent(
                                       controller: cubit.passwordController,
                                       hintText: AppStrings.password,
                                      icon: Icons.lock_outline_rounded,
                                       obscureText: true,
                                       validator: (data) {
                                         if (data!.isEmpty && data.length < 9) {
                                           return "Enter Your Password Strong";
                                         }
                                         return null;
                                       },
                                    ),
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    CustomButton(
                                      background: AppColors.deepBlue,
                                      radius: 50,
                                      width: 110,
                                      onPressed: ()async{
                                        // sign up
                                        if (cubit.signUpKey.currentState!.validate()) {
                                          // Save Data && Go To Home Screen
                                          await cubit.signUp();
                                        }
                                      },
                                      text: AppStrings.register,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    );
                  }),
                  SizedBox(
                    height: 40.h,
                  ),
                  Center(
                    child: CustomButton(
                      radius: 50,
                      height: 50,
                      width: 110,
                      onPressed: () {
                        navigateReplacement(
                          context: context,
                          route: Routes.login,
                        );
                      },
                      text: AppStrings.login,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
