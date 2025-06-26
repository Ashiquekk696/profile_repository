import 'package:flutter/material.dart';
import 'package:profile_editor/core/constants/app_colors.dart';
import 'package:profile_editor/core/constants/app_textstyles.dart';
import 'package:profile_editor/core/extensions/space_extension.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final int maxLines;
  final TextInputType keyboardType;

  const AppTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    this.validator,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    final isRequired = validator != null;
    final displayLabel = isRequired ? '$label *' : label;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          displayLabel,
          style: AppTextStyles.label.copyWith(color: AppColors.grey600),
        ),
        6.0.h,
        TextFormField(
          controller: controller,
          validator: validator,
          maxLines: maxLines,
          keyboardType: keyboardType,
          style: AppTextStyles.bold,
          decoration: InputDecoration(
            hintText: 'Enter $label',
            hintStyle: AppTextStyles.label.copyWith(color: AppColors.grey),
            prefixIcon: Icon(icon, color: AppColors.grey600),
            filled: true,
            fillColor: AppColors.greyFill,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
