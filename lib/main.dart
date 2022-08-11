import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutm_food_app/app/bloc/auth_bloc.dart';
import 'package:nutm_food_app/app/bloc_observer.dart';
import 'package:nutm_food_app/app_container.dart';
import 'package:nutm_food_app/features/auth/bloc/login_bloc.dart';
import 'package:nutm_food_app/locator.dart';
import 'package:nutm_food_app/service/auth_service.dart';
import 'package:nutm_food_app/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpLocator();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = locator<AuthService>();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) =>
                AuthBloc(authService: authService)..add(AppStarted()),
          ),
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(authService: authService,  authBloc:  BlocProvider.of<AuthBloc>(context)),
          ),
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: AppTheme.theme,
            home: const AppContainer()),
      ),
    );
  }
}
