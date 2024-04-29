import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healhify/core/utils/app_assets.dart';
import 'package:healhify/core/utils/app_colors.dart';
import 'package:healhify/core/widget/show_dialog_widget.dart';
import 'package:healhify/feature/auth/presentation/cubits/log_in_cubit/log_in_cubit.dart';
import 'package:healhify/feature/auth/presentation/cubits/sign_up_cubit/sign_up_state.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/commons.dart';
import '../../../../core/widget/back_widget.dart';
import '../../../../core/widget/background_widget.dart';
import '../../../../core/widget/custom_buttom.dart';
import '../component/container_component.dart';
import '../component/text_form_field_component.dart';
import '../cubits/log_in_cubit/log_in_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {
                    if (state is LoginErrorState) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return ShowDialogWidget(
                            title: state.errorMs,
                          );
                        },
                      );
                    } else if (state is LoginSuccessState) {
                      showSnackBar(context, 'Login Success', Colors.green);
                      navigateReplacement(context: context, route: Routes.home);
                    }
                  }, builder: (context, state) {
                    final cubit = BlocProvider.of<LoginCubit>(context);
                    return Form(
                      key: cubit.loginKey,
                      child: state is LoadingState
                          ? const Center(child: CircularProgressIndicator())
                          : ContainerComponent(
                              height: 360.h,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
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
                                      height: 25.h,
                                    ),
                                    TextFormFieldComponent(
                                      controller: cubit.passwordController,
                                      hintText: AppStrings.password,
                                      icon: Icons.lock_outline_rounded,
                                      obscureText: true,
                                      validator: (data) {
                                        if (data!.isEmpty) {
                                          return "Enter Your password";
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
                                      onPressed: () async {
                                        if (cubit.loginKey.currentState!
                                            .validate()) {
                                          await cubit.login();
                                        }
                                      },
                                      text: AppStrings.login,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        navigate(
                                          context: context,
                                          route: Routes.forget,
                                        );
                                      },
                                      child: Text(
                                        AppStrings.forgetPassword,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge!
                                            .copyWith(
                                              fontSize: 18,
                                            ),
                                      ),
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
                          route: Routes.register,
                        );
                      },
                      text: AppStrings.register,
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
