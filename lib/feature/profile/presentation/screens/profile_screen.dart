import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healhify/core/utils/commons.dart';
import 'package:healhify/core/widget/container_component.dart';
import 'package:healhify/core/widget/custom_buttom.dart';
import 'package:healhify/feature/profile/presentation/cubit/profile_cubit/profile_cubit.dart';
import 'package:healhify/feature/profile/presentation/cubit/profile_cubit/profile_state.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../component/user_data_component.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
        final cubit = BlocProvider.of<ProfileCubit>(context);
        return state is ProfileLoadingState
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    AppStrings.profile,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: 35.sp,
                          color: AppColors.deepBlue,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    AppStrings.changeInformation,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  const Spacer(),
                  ContainerComponent(
                    height: 240.h,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          UserDataComponent(
                            text: 'Name : ${cubit.userModel!.name}',
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          UserDataComponent(
                            text: 'Email : ${cubit.userModel!.email}',
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          CustomButton(
                            background: AppColors.deepBlue,
                            onPressed: () {
                              navigate(
                                context: context,
                                route: Routes.forget,
                              );
                            },
                            text: 'Change Password',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomButton(
                    background: AppColors.red,
                    onPressed: () {
                      cubit.logout();
                      navigateReplacement(
                        context: context,
                        route: Routes.login,
                      );
                    },
                    text: 'Logout',
                  ),
                  const Spacer(flex: 1,),

                ],
              );
      }),
    );
  }
}
