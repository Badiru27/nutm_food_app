import 'package:flutter/material.dart';
import 'package:nutm_food_app/features/auth/auth._page.dart';
import 'package:nutm_food_app/shared/app_button.dart';
import 'package:nutm_food_app/themes/app_theme.dart';
import 'package:nutm_food_app/util/ui_helpers.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Food Signing',
          style: theme.textTheme.headline5,
        ),
        actions: [
          PopupMenuButton<String>(
              onSelected: (String value) {
                if (value == 'Logout') {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AuthPage()));
                }
              },
              itemBuilder: (context) => {'Logout'}
                  .map((e) => PopupMenuItem<String>(value: e,child: Text(e),))
                  .toList())
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UiHelpers.verticalSpacer(62),
              SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset('assets/thinking.gif')),
              UiHelpers.verticalSpacer(20),
              Text(
                'Sign for Breakfast',
                style: theme.textTheme.headline3,
              ),
              UiHelpers.verticalSpacer(20),
              Text(
                'You have already gotten food',
                style: theme.textTheme.caption!.copyWith(
                  color: AppTheme.orange,
                ),
              ),
              UiHelpers.verticalSpacer(50),
              AppButton(
                title: 'Get breakfast',
                // isBusy: ref.watch(authControllerProvider).isLoading,
                onButtonTapped: () {},
              ),
              UiHelpers.verticalSpacer(150),
            ],
          ),
        ),
      ),
    );
  }
}
