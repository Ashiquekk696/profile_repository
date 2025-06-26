import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:profile_editor/core/constants/app_colors.dart';
import 'package:profile_editor/core/constants/app_strings.dart';
import 'package:profile_editor/core/constants/app_textstyles.dart';
import 'package:profile_editor/core/extensions/space_extension.dart';
import 'package:profile_editor/features/profile/data/models/profile_model.dart';

class ProfileView extends StatelessWidget {
  final ProfileModel profile;

  const ProfileView({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 15,
              spreadRadius: 2,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            CircleAvatar(
  radius: 55,
  backgroundColor: AppColors.greyFill,
  child: ClipOval(
    child: profile.avatar != null
        ? CachedNetworkImage(
            imageUrl: profile.avatar!,
            width: 110,
            height: 110,
            fit: BoxFit.cover,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) =>
                const Icon(Icons.error, color: AppColors.icon),
          )
        : const Icon(Icons.person, size: 60, color: AppColors.icon),
  ),
),

          30.0.h,
              _buildProfileItem(
                Icons.person,
                AppStrings.name,
                profile.name ?? "Not specified",
              ),
              _buildProfileItem(
                Icons.info_outline,
                AppStrings.bio,
                profile.bio ?? "Not specified",
              ),
              _buildProfileItem(
                Icons.email_outlined,
                AppStrings.email,
                profile.email ?? "Not specified",
              ),
              _buildProfileItem(
                Icons.phone_android,
                AppStrings.phone,
                profile.phone ?? "Not specified",
              ),
              _buildProfileItem(
                Icons.location_on_outlined,
                AppStrings.location,
                profile.city ?? "Not specified",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 24, color: AppColors.grey700),
     12.0.w,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppTextStyles.label),
          4.0.h,
                Text(value, style: AppTextStyles.bold),
                const Divider(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}