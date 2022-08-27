import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutm_food_app/features/auth/bloc/login_bloc.dart';
import 'package:nutm_food_app/features/home/bloc/home_bloc.dart';
import 'package:nutm_food_app/shared/app_button.dart';
import 'package:nutm_food_app/themes/app_theme.dart';
import 'package:nutm_food_app/util/ui_helpers.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    final homeBloc = BlocProvider.of<HomeBloc>(context);


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
                  loginBloc.add(LogOutButtonPressed());
                }
              },
              itemBuilder: (context) => {'Logout'}
                  .map((e) => PopupMenuItem<String>(
                        value: e,
                        child: Text(e),
                      ))
                  .toList())
        ],
      ),
      body: BlocListener<HomeBloc, HomeState>(
        listenWhen: (context, state)=> state is HomeFailure || state is GetFoodSuccess,
        listener: (_, state) {

            if (state is HomeFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
                backgroundColor: Theme.of(context).errorColor,
              ));
            } else if (state is GetFoodSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
                backgroundColor: Theme.of(context).primaryColor,
              ));
            }

        },
        child: BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (context, state) => state is! HomeLoading || state is AlreadyGottenFood || state is YetToGetFood,
          builder: (context, state) {
            if (state is AlreadyGottenFood) {
              return _contentWidget(
                  theme: theme,
                  homeBloc: homeBloc,
                  context: context,
                  state: state,
                  header: 'You have gotten ${state.meal}',
                  showButton: false,
                  subHeader: "Your food has already been signed and collected");
            } else {
              return _contentWidget(
                  theme: theme,
                  state: state,
                  context: context,
                  homeBloc: homeBloc,
                  header: 'Sign for ${state.meal}',
                  subHeader: "Ensure to collect your food before signing");
            }
          },
        ),
      ),
    );
  }

  Widget _contentWidget(
      {required HomeState state,
      required ThemeData theme,
      required String header,
      required String subHeader,
      required BuildContext context,
      required HomeBloc homeBloc,
      bool showButton = true}) {
    return Padding(
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
              header,
              style: theme.textTheme.headline3,
            ),
            UiHelpers.verticalSpacer(20),
            Text(
              subHeader,
              style: theme.textTheme.caption!.copyWith(
                color: AppTheme.orange,
              ),
            ),
            UiHelpers.verticalSpacer(50),
            if (showButton)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: AppButton(
                  title: 'Get ${state.meal}',
                   isBusy: state is HomeLoading,
                  onButtonTapped: () {
                    homeBloc.add(GetFoodButtonPressed());
                  },

                ),
              ),
            UiHelpers.verticalSpacer(150),
          ],
        ),
      ),
    );
  }
}
