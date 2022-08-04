import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static BorderRadius appBorderRadius = BorderRadius.circular(10.r);
  static double buttonWidth = 160.w;
  static double buttonHeight = 52.h;
  static double selectHeight = 40.h;

  // colors
  static const Color primaryColor = Color(0xFF029D5B);
  static const Color white = Color(0xFFFFFFFF);
  static const Color darkGrey = Color(0xFF0C0F14);
  static const Color grey = Color(0xFF141921);
  static const Color lightGrey = Color(0xFF383C49);
  static const Color lightBlue = Color(0xFF665BE6);
  static const Color orange = Color(0xFFFF8C00);
  static const Color veryLightGrey = Color(0xFF979797);
  static const Color iconColor = Color(0xFF999999);

  // text theme
  static TextTheme textTheme = TextTheme(
    headline3: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 30.sp,
      fontWeight: FontWeight.w500,
      height: 1.172.h,
      color: white,
    ),
    headline4: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
      height: 1.172.h,
      color: white,
    ),
    headline5: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 18.sp,
      fontWeight: FontWeight.w400,
      color: white,
      height: 1.172.h,
    ),
    bodyText1: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      height: 1.172.h,
      color: white,
    ),
    bodyText2: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      height: 1.172.h,
      color: white,
    ),
    caption: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      height: 1.172.h,
      color: white,
    ),
  );

  static ThemeData theme = ThemeData(
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: darkGrey),
    backgroundColor: darkGrey,
    scaffoldBackgroundColor: darkGrey,
    primaryColor: primaryColor,
    indicatorColor: primaryColor,
    hintColor: lightGrey,
    iconTheme: const IconThemeData(color: white),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: grey,
      filled: true,
      iconColor: white,
      prefixIconColor: white,
      border: OutlineInputBorder(
        borderRadius: appBorderRadius,
        borderSide: BorderSide.none,
      ),
      // focusedBorder: OutlineInputBorder(
      //   borderRadius: appBorderRadius,
      //   borderSide: BorderSide(color: white, width: 0.5.w),
      // ),
    ),
    primaryIconTheme: const IconThemeData(color: white),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: textTheme,
    unselectedWidgetColor: lightGrey,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: lightBlue,
      selectionColor: lightGrey,
      selectionHandleColor: lightBlue,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 90,
      backgroundColor: grey,
      selectedItemColor: white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: darkGrey,
      toolbarTextStyle: TextStyle(
        fontSize: 18,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 14,
        ),
        primary: lightBlue,
      ),
    ),
    cardTheme: const CardTheme(
      color: grey,
    ),
    listTileTheme: const ListTileThemeData(iconColor: white),
    // chipTheme: ChipThemeData(
    //   labelStyle: theme.textTheme.bodyText1,
    // ),
  );
}
