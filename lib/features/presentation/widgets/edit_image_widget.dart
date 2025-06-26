import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:profile_editor/core/constants/app_colors.dart';
import 'package:profile_editor/features/presentation/bloc/profile_bloc.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: GetIt.I<ProfileBloc>(),
      builder: (context, state) {
        final imageUrl = state.profile.avatar;

        Widget imageWidget;

        if (imageUrl == null) {
          imageWidget = const Icon(Icons.person, size: 60, color: AppColors.icon);
        } else if (imageUrl.startsWith('http')) {
          imageWidget = CachedNetworkImage(
            imageUrl: imageUrl,
            width: 110,
            height: 110,
            fit: BoxFit.cover,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error, color: AppColors.icon),
          );
        } else {
          final decodedBytes = base64Decode(imageUrl.split(',').last);
          imageWidget = Image.memory(
            decodedBytes,
            width: 110,
            height: 110,
            fit: BoxFit.cover,
          );
        }

        return Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: 55,
              backgroundColor: AppColors.greyFill,
              child: ClipOval(child: imageWidget),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  GetIt.I<ProfileBloc>().add(UploadProfileImageEvent());
                },
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 18,
                  child: const Icon(
                    Icons.edit,
                    size: 16,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
