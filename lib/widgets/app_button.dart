import 'package:flutter/material.dart'; 
import 'package:profile_editor/core/constants/app_textstyles.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  const AppButton({super.key, required this.onTap,required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onTap,
        child: Text(
         title,
          style: AppTextStyles.label.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
