import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healhify/core/utils/app_assets.dart';
import 'package:healhify/core/widget/back_widget.dart';
import 'package:healhify/core/widget/background_widget.dart';
import 'package:healhify/core/widget/container_component.dart';
import 'package:healhify/feature/home/presentation/cubit/chest_cubit/chest_cubit.dart';
import 'package:healhify/feature/home/presentation/cubit/chest_cubit/chest_state.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widget/custom_buttom.dart';
import '../../../../core/widget/show_dialog_widget.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key, required this.title, required this.subTitle, required this.image});

  final String title;
  final String subTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ScanXrayChestCubit, ScanXrayChestState>(
          builder: (context, state) {
        final cubit = BlocProvider.of<ScanXrayChestCubit>(context);
        return PopScope(
          canPop: true,
          onPopInvoked: (didPop) {
            cubit.imageFile = null;
          },
          child: Scaffold(
            body: BackGroundWidget(
              image: AppAssets.backGroundTwo,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 25.w,vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BackWidget(),
                    Center(
                      child: Text(
                        title,
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
                        subTitle,
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontSize: 18.sp,
                                ),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),

                    Center(child: Image.asset(image)),

                    SizedBox(
                      height: 15.h,
                    ),
                    ContainerComponent(
                      height: 420.h,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 15, top: 1),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Center(
                                child: Text(
                                  AppStrings.titleImage,
                                  textAlign: TextAlign.center,
                                  style:
                                  Theme.of(context).textTheme.displayMedium!.copyWith(
                                    fontSize: 20.sp,
                                    color: AppColors.deepBlue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                width: 198.w,
                                height: 170.h,
                                decoration: BoxDecoration(
                                  color: AppColors.blackTwo,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: cubit.imageFile == null
                                      ? Center(
                                          child: Icon(
                                            Icons.camera_enhance_outlined,
                                            size: 45.sp,
                                            color: AppColors.white,
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius: BorderRadius.circular(25),
                                          child: Image.file(
                                            cubit.imageFile!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              CustomButton(
                                background: AppColors.deepBlue,
                                radius: 50,
                                width: 110,
                                onPressed: () {
                                  cubit.pickedImage(source: ImageSource.gallery);
                                },
                                text: AppStrings.upload,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              CustomButton(
                                background: AppColors.deepBlue,
                                radius: 50,
                                width: 110,
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return cubit.imageFile != null ? ShowDialogWidget(
                                        title: cubit.result,
                                      ) :const ShowDialogWidget(
                                        title: 'No Image Selected!',
                                      ) ;
                                    },
                                  );
                                },
                                text: AppStrings.scan,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
