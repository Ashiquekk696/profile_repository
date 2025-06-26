import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'package:go_router/go_router.dart';
import 'package:profile_editor/core/constants/app_strings.dart';
import 'package:profile_editor/core/constants/app_textstyles.dart';
import 'package:profile_editor/core/utils/app_toast.dart';
import 'package:profile_editor/core/widgets/error_widget.dart';
import 'package:profile_editor/core/widgets/loading_indicator.dart';
import 'package:profile_editor/di/injector.dart';
import 'package:profile_editor/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:profile_editor/features/profile/presentation/widgets/profile_view_widget.dart';  
import 'package:profile_editor/core/constants/app_colors.dart'; 

class ViewProfilePage extends StatefulWidget {
  const ViewProfilePage({super.key});

  @override
  State<ViewProfilePage> createState() => _ViewProfilePageState();
}

class _ViewProfilePageState extends State<ViewProfilePage> {
  final _bloc = getIt<ProfileBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(LoadProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 2,
        title: Text(AppStrings.viewProfile, style: AppTextStyles.bold),
        iconTheme: const IconThemeData(color: AppColors.text),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined, size: 26),
            tooltip: 'Edit Profile',
            onPressed: () => context.push('/edit'),
          ),
        ],
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        bloc: _bloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state.fetchProfileStatus == ApiStatus.loading) {
            return const Center(child: LoadingIndicator());
          }
            if (state.editProfileStatus == ApiStatus.success) {
         AppToast.show(  'Profile updated successfully');
          }

          if (state.fetchProfileStatus == ApiStatus.failure) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: ErrorDisplay(
                message: state.errorMessage??"",
                onRetry: () => _bloc.add(LoadProfileEvent()),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: SingleChildScrollView(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: ProfileView(profile: state.profile),
              ),
            ),
          );
        },
      ),
    );
  }
}
