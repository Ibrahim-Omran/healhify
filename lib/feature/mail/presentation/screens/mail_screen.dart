
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healhify/core/widget/custom_text_form_field.dart';
import 'package:healhify/feature/mail/presentation/cubit/mail_cubit/mail_cubit.dart';
import 'package:healhify/feature/mail/presentation/cubit/mail_cubit/mail_state.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widget/container_component.dart';
import '../../../../core/widget/custom_buttom.dart';

class MailScreen extends StatelessWidget {
  const MailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: BlocBuilder<MailCubit,MailState>(
          builder: (context,state) {
            final cubit = BlocProvider.of<MailCubit>(context);
            return Form(
              key: cubit.mailKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    AppStrings.contactUs,
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
                    AppStrings.sendEmail,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(
                    height: 35.h,
                  ),

                  ContainerComponent(
                    height: 400,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [

                          SizedBox(
                            height: 10.h,
                          ),

                          SizedBox(
                            width: 200.w,
                            child: CustomTextFormField(
                              controller: cubit.subjectController,
                              hintText: 'Subject',
                              validator: (data) {
                                if (data!.isEmpty) {
                                  return "Enter Your Subject";
                                }
                                return null;
                              },
                            ),
                          ),

                          SizedBox(
                            height: 20.h,
                          ),


                          Text(
                            'Your Message',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                              fontSize: 18.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(
                            height: 200.h,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextFormField(
                                controller: cubit.messageController,
                                hintText: 'Message',
                                border: InputBorder.none,
                                maxLines: null,
                                validator: (data) {
                                  if (data!.isEmpty) {
                                    return "Enter Your Message";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.multiline,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)
                                ),


                              ),
                            ),
                          ),


                          CustomButton(
                            radius: 50,
                            height: 50,
                            width: 110,
                            background: AppColors.deepBlue,
                            onPressed: () async {
                              if (cubit.mailKey.currentState!
                                  .validate()) {
                                await cubit.sendMail();
                              }
                            },
                            text: AppStrings.send,
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
