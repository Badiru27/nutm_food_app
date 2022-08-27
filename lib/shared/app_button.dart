import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutm_food_app/themes/app_theme.dart';
import 'package:nutm_food_app/util/ui_helpers.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    this.buttonColor,
    required this.title,
    this.leadingIcon,
    this.onButtonTapped,
    this.isBusy = false,
    this.width,
  }) : super(key: key);
  final Color? buttonColor;
  final String title;
  final Widget? leadingIcon;
  final void Function()? onButtonTapped;
  final bool isBusy;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: buttonColor ?? AppTheme.primaryColor,
        fixedSize: Size(
          width ?? UiHelpers.screenWidth(context),
          AppTheme.buttonHeight,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppTheme.appBorderRadius,
        ),
      ),
      onPressed: onButtonTapped,
      child: isBusy
          ? const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: CircularProgressIndicator(
                  color: AppTheme.white,
                ),
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (leadingIcon != null)
                  Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: leadingIcon,
                  ),
                Text(
                  title,
                  style: theme.textTheme.bodyText1,
                ),
              ],
            ),
    );
  }
}
