import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healhify/core/utils/app_assets.dart';
import 'package:healhify/core/widget/background_widget.dart';
import 'package:healhify/feature/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:healhify/feature/home/presentation/cubit/home_cubit/home_state.dart';

import '../../../../core/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<HomeCubit,HomeState>(
        builder: (context,state) {
          final cubit = BlocProvider.of<HomeCubit>(context);
          return Scaffold(
            bottomNavigationBar: CurvedNavigationBar(
              color: AppColors.blue,
              height: 65.h,
              backgroundColor: AppColors.white,
              items:  const [
                CurvedNavigationBarItem(
                  child: Icon(Icons.person,size: 35,color: AppColors.white,),
                ),
                CurvedNavigationBarItem(
                  child: Icon(Icons.home_filled,size: 35,color: AppColors.white,),
                ),
                CurvedNavigationBarItem(
                  child: Icon(Icons.mail,size: 35,color: AppColors.white,),
                ),

              ],
              index: 1,
              onTap: (index) {
                // Handle button tap
                cubit.changeIndex(index);
              },
            ),
            body: BackGroundWidget(
              image: AppAssets.backGroundTwo,
              child: cubit.screens[cubit.currentIndex],
            ),
          );
        }
      ),
    );
  }
}
