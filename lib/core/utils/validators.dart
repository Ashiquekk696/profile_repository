import 'package:flutter/material.dart';
import 'package:profile_editor/core/constants/app_strings.dart';

class Validators {
  static FormFieldValidator<String> validateEmptyField(String field) {
    return (value) {
      if (value == null || value.trim().isEmpty) {
        return "$field is required";
      }
      return null;
    };
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required";
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return AppStrings.emailError;
    }

    return null;
  }
 
}
