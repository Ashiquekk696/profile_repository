import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:profile_editor/core/constants/app_colors.dart';
import 'package:profile_editor/core/constants/app_textstyles.dart';
import 'package:profile_editor/core/widgets/error_widget.dart';
import 'package:profile_editor/core/widgets/loading_indicator.dart';
import 'package:profile_editor/di/injector.dart';
import '../bloc/profile_bloc.dart';
import '../widgets/profile_form_widget.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Edit Profile', style: AppTextStyles.bold),
        elevation: 2,
        backgroundColor: AppColors.white,
        iconTheme: const IconThemeData(color: AppColors.text),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        bloc: getIt<ProfileBloc>(),
        builder: (context, state) {
          if (state.editProfileStatus == ApiStatus.loading) {
            return const Center(child: LoadingIndicator());
          } else if (state.editProfileStatus == ApiStatus.failure) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: ErrorDisplay(
                message: state.errorMessage??"",
                onRetry: () => GetIt.I<ProfileBloc>().add(LoadProfileEvent()),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: SingleChildScrollView(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: ProfileForm(profile: state.profile),
              ),
            ),
          );
        },
      ),
    );
  }
}
