import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutm_food_app/app/bloc/auth_bloc.dart';
import 'package:nutm_food_app/features/auth/bloc/login_bloc.dart';
import 'package:nutm_food_app/features/home/pages/home_page.dart';
import 'package:nutm_food_app/shared/app_button.dart';
import 'package:nutm_food_app/shared/app_input_field.dart';
import 'package:nutm_food_app/shared/app_password_input_field.dart';
import 'package:nutm_food_app/themes/app_theme.dart';
import 'package:nutm_food_app/util/ui_helpers.dart';
import 'package:nutm_food_app/util/validator.dart';

class LogInPage extends HookWidget {
  const LogInPage({Key? key}) : super(key: key);
  static final _formKey = GlobalKey<FormState>();

  static const String routes = '/login';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Let\'s Sign In',
            style: theme.textTheme.headline5,
          ),
        ),
        body: BlocListener<LoginBloc, LoginState>(
          listener: (_, state) {
            if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
                backgroundColor: Theme.of(context).errorColor,
              ));
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return SingleChildScrollView(
                reverse: true,
                physics: const ClampingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UiHelpers.verticalSpacer(62),
                        Text(
                          'Welcome Back!',
                          style: theme.textTheme.headline3,
                        ),
                        UiHelpers.verticalSpacer(57),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Sign in to continue',
                            style: theme.textTheme.subtitle1,
                          ),
                        ),
                        AppInputField(
                          hintText: 'Email',
                          hintStyle: theme.textTheme.bodyText1,
                          controller: emailController,
                          validator: context.validateEmailAddress,
                        ),
                        UiHelpers.verticalSpacer(20),
                        AppPasswordInputField(
                            hintText: 'Password',
                            hintStyle: theme.textTheme.bodyText1,
                            controller: passwordController,
                            validator: context.validatePassword,
                            obscureText: state.isObscured,
                            onSuffixTapped: () {
                              loginBloc.add(PasswordIconTapped());
                            }),

                        UiHelpers.verticalSpacer(8),
                        GestureDetector(
                          onTap: () {
                            // TODO Navigate to forgot password view
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Forgot Password',
                              style: theme.textTheme.caption!.copyWith(
                                color: AppTheme.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        UiHelpers.verticalSpacer(75),
                        AppButton(
                          title: 'Sign In',
                          isBusy: state is LoginLoading,
                          onButtonTapped: () {
                            if (_formKey.currentState!.validate()) {
                              loginBloc.add(LoginInButtonPressed(
                                  email: emailController.text,
                                  password: passwordController.text));
                            }
                          },
                        ),
                        UiHelpers.verticalSpacer(90),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'In Africa,',
                              style: theme.textTheme.bodyText2,
                            ),
                            GestureDetector(
                              onTap: () {
                                _formKey.currentState?.reset();
                              },
                              child: Text(
                                ' for Africa',
                                style: theme.textTheme.bodyText2!.copyWith(
                                  color: AppTheme.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        UiHelpers.verticalSpacer(50),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            '© Badiru Sulaimon 2022',
                            style: theme.textTheme.bodyText2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
