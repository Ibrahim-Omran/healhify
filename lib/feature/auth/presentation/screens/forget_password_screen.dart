import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healhify/feature/auth/presentation/cubits/forget_password_cubit/forget_cubit.dart';
import 'package:healhify/feature/auth/presentation/cubits/forget_password_cubit/forget_state.dart';

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

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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
                  BlocConsumer<ForgetCubit, ForgetState>(
                      listener: (context, state) {
                    if (state is ForgetErrorState) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return ShowDialogWidget(
                            title: state.errorMs,
                          );
                        },
                      );
                    } else if (state is ForgetSuccessState) {
                      showSnackBar(context, 'Check Email', Colors.green);
                      Navigator.pop(context);
                    }
                  }, builder: (context, state) {
                    final cubit = BlocProvider.of<ForgetCubit>(context);
                    return state is ForgetLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : Form(
                            key: cubit.forgetKey,
                            child: ContainerComponent(
                              height: 240.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 20.h,
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
                                    height: 25.h,
                                  ),
                                  CustomButton(
                                    background: AppColors.deepBlue,
                                    radius: 50,
                                    width: 110,
                                    onPressed: () async {
                                      if (cubit.forgetKey.currentState!
                                          .validate()) {
                                        await cubit.forgetPassword();
                                      }
                                    },
                                    text: AppStrings.send,
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                ],
                              ),
                            ),
                          );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
