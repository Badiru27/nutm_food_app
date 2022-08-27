import 'package:flutter/material.dart';

extension ValidationExtension on BuildContext {
  String? validateFieldNotEmpty(String? value) =>
      value == null || value.isEmpty ? 'Field cannot be empty' : null;

  String? validateFieldNotNull<T>(T? value) =>
      value == null ? 'Field cannot be empty' : null;

  String? validateEmailAddress(String? value) {
    if (value == null) return 'Field cannot be empty';

    if (value.isEmpty) return 'Field cannot be empty';

    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    return !emailValid ? 'Enter a Valid Email Address' : null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null) return 'Field cannot be empty';

    if (value.isEmpty) return 'Field cannot be empty';

    final reg = RegExp(r'^[0-9+]{7,15}$');
    return !reg.hasMatch(value) ? 'Enter a Valid Mobile Number' : null;
  }

  String? validateText(String? value, String name) {
    if (value == null) return 'Field cannot be empty';
    if (value.isEmpty) return 'Field cannot be empty';
    return null;
  }

  String? validateResetCode(String? value) {
    if (value == null) return 'Enter code sent to your mail';
    if (value.isEmpty) return 'Enter code sent to your mail';
    if (value.length != 6) return 'Code must be 6 digits';
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null) return 'Field cannot be empty';
    if (value.trim().isEmpty) return 'Enter Valid Password';
    if (value.length < 6) return 'Password must be at least 6 characters';

    return null;
  }

  String? validatePin(String? value) {
    if (value == null) return 'Empty';
    if (value.trim().isEmpty) return 'Empty';
   // if (value.trim().length<=3) return 'Pin must be 4 digit';
   

    return null;
  }

  String? validateDate(v) {
    if (v == null) return 'Booking Date is required';
    return null;
  }
}
