import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutm_food_app/features/auth/auth._page.dart';
import 'package:nutm_food_app/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child)=>MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.theme,
        home: const AuthPage()
      ),
    );
  }
}

