import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healhify/core/utils/app_assets.dart';
import 'package:healhify/core/utils/app_colors.dart';
import 'package:healhify/core/utils/commons.dart';
import 'package:healhify/feature/home/presentation/cubit/chest_cubit/chest_cubit.dart';
import 'package:healhify/feature/home/presentation/cubit/chest_cubit/chest_state.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../component/service_component.dart';

class HomeBodyScreen extends StatelessWidget {
  const HomeBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScanXrayChestCubit,ScanXrayChestState>(
      builder: (context,state) {
        final cubit = BlocProvider.of<ScanXrayChestCubit>(context);
        return Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Center(
              child: Text(
                AppStrings.service,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: AppColors.blue,
                      fontSize: 35.sp,
                    ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Center(
              child: Text(
                AppStrings.checkYourBody,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 18.sp,
                    ),
              ),
            ),


            const Spacer(),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ServicesComponent(
                    title: AppStrings.bones,
                    image: AppAssets.bones,
                    onTap: (){
                      cubit.model = 'assets/models/bones/bones.tflite';
                      cubit.label = 'assets/models/bones/labels.txt';
                      cubit.loadDataModelFile();
                      navigate(
                          context: context,
                          route: Routes.scan,
                        arg: {
                            'title' : AppStrings.bones,
                            'subTitle' : AppStrings.bonesSubTitle,
                            'image' : AppAssets.bones,
                        }
                      );
                    },
                  ),

                  SizedBox(
                    width: 50.h,
                  ),

                  ServicesComponent(
                    title: AppStrings.covid,
                    image: AppAssets.covid,
                    onTap: (){
                      cubit.model = 'assets/models/covid/covid.tflite';
                      cubit.label = 'assets/models/covid/labels.txt';
                      cubit.loadDataModelFile();
                      navigate(
                          context: context,
                          route: Routes.scan,
                          arg: {
                            'title' : AppStrings.covid,
                            'subTitle' : AppStrings.covidSubTitle,
                            'image' : AppAssets.covid,
                          }
                      );
                    },
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 50.h,
            ),

            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ServicesComponent(
                    title: AppStrings.skin,
                    image: AppAssets.skin,
                    onTap: (){
                      cubit.model = 'assets/models/skin/skin.tflite';
                      cubit.label = 'assets/models/skin/labels.txt';
                      cubit.loadDataModelFile();
                      navigate(
                          context: context,
                          route: Routes.scan,
                          arg: {
                            'title' : AppStrings.skin,
                            'subTitle' : AppStrings.skinSubTitle,
                            'image' : AppAssets.skin,
                          }
                      );
                    },
                  ),

                  SizedBox(
                    width: 50.h,
                  ),

                  ServicesComponent(
                    title: AppStrings.lungs,
                    image: AppAssets.lungs,
                    onTap: (){
                      cubit.model = 'assets/models/lung/lung.tflite';
                      cubit.label = 'assets/models/lung/labels.txt';
                      cubit.loadDataModelFile();
                      navigate(
                          context: context,
                          route: Routes.scan,
                          arg: {
                            'title' : AppStrings.lungs,
                            'subTitle' : AppStrings.lungsSubTitle,
                            'image' : AppAssets.lungs,
                          }
                      );

                    },
                  ),
                ],
              ),
            ),
            const Spacer(flex: 2,),

          ],
        );
      }
    );
  }
}
