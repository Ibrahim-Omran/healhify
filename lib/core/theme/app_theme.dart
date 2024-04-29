
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    //scaffoldBackgroundColor
    scaffoldBackgroundColor: AppColors.deepBlue,

    //appBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
    ),

    //text theme
    textTheme: TextTheme(
      displayLarge: boldStyle(),
      displayMedium: regularStyle(),
      //displaySmall: regularStyleTwo()
    ),

    // //button theme
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //       backgroundColor: AppColors.primary,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(8),
    //       )),
    // ),

    // text field
    inputDecorationTheme:  InputDecorationTheme(

      // //enabled Border
      enabledBorder:  OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.white,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      //
      // //focused Border
      focusedBorder:  OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.white,
          ),
        borderRadius: BorderRadius.circular(50),
      ),
      //
      // //error Border
      errorBorder:  OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.white,
          ),
        borderRadius: BorderRadius.circular(50),
      ),

      //hint text
      hintStyle: boldStyle(color: AppColors.deepBlue, fontSize: 19,),

      filled: true,
      fillColor: AppColors.white,
    ),
    //
    // // text button Style ..
    // textButtonTheme: TextButtonThemeData(
    //
    //
    //   style: ButtonStyle(
    //     foregroundColor: MaterialStateProperty.all(
    //       AppColors.blue,
    //     ),
    //     textStyle: MaterialStateProperty.all(
    //       boldStyle(color: AppColors.white, fontSize: 14),
    //     ),
    //   ),
    // ),
  );
}


ThemeData getAppDarkTheme(){
  return ThemeData(
    primaryColor: AppColors.primary,
    //scaffoldBackgroundColor
    scaffoldBackgroundColor: AppColors.black,

    //appBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
    ),

    //text theme
    textTheme: TextTheme(
      displayLarge: boldStyle(color: AppColors.white),
      displayMedium: regularStyle(),
        displaySmall: regularStyleTwo(color: Colors.white)
    ),

    //button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
    ),

    // text field
    inputDecorationTheme: InputDecorationTheme(

      // //enabled Border
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primary,
        ),
      ),
      //
      // //focused Border
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primary,
          )
      ),
      //
      // //error Border
      errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primary,
          )
      ),

      //hint text
      hintStyle: regularStyle(color: AppColors.black, fontSize: 14),

      // filled: true,
      // fillColor: AppColors.backGroundTextField,
    ),

    // text button Style ..
    textButtonTheme: TextButtonThemeData(

      style: ButtonStyle(

        foregroundColor: MaterialStateProperty.all(
          AppColors.blue,
        ),
        textStyle: MaterialStateProperty.all(
          boldStyle(color: AppColors.white, fontSize: 14),
        ),
      ),
    ),
  );
}