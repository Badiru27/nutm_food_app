import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppPasswordInputField extends StatelessWidget {
  const AppPasswordInputField({
    Key? key,
    this.controller,
    this.keyboardType,
    this.maxLines,
    this.obscureText = true,
    this.validator,
    this.hintText,
    this.hintStyle,
    this.onSuffixTapped,
  }) : super(key: key);
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool obscureText;
  final String? Function(String?)? validator;
  final String? hintText;
  final TextStyle? hintStyle;
  final void Function()? onSuffixTapped;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      style: theme.textTheme.bodyText1,
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines ?? 1,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        focusedBorder: theme.inputDecorationTheme.focusedBorder,
        suffixIcon: GestureDetector(
          onTap: onSuffixTapped,
          child: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            size: 16.sp,
          ),
        ),
      ),
    );
  }
}
