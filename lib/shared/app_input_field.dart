import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInputField extends StatelessWidget {
  const AppInputField({
    Key? key,
    this.controller,
    this.keyboardType,
    this.maxLines,
    this.obscureText,
    this.validator,
    this.hintText,
    this.hintStyle,
    this.prefixIcon,
  }) : super(key: key);
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      style: theme.textTheme.bodyText1,
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines ?? 1,
      obscureText: obscureText ?? false,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        focusedBorder: theme.inputDecorationTheme.focusedBorder,
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: EdgeInsets.only(left: 12.w),
                child: prefixIcon,
              )
            : null,
      ),
    );
  }
}
