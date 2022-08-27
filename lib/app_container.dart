import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutm_food_app/app/bloc/auth_bloc.dart';
import 'package:nutm_food_app/features/auth/page/auth_page.dart';
import 'package:nutm_food_app/features/home/pages/home_page.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AuthNotAuthenticated) {
          return const LogInPage();
        } else if (state is AuthAuthenticated) {
          return const HomePage();
        } else if (state is AuthFailed) {
          return const Scaffold(body:  Center(child: Text('Failed to authenticate')));
        } else {
          return  Scaffold(
              body: Center(child: Text('Unknown state: $state')));
        }

      },
    );
  }
}
