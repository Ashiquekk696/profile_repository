 
import 'package:flutter/material.dart'; 
import 'package:get_it/get_it.dart';
import 'package:profile_editor/core/constants/app_colors.dart';
import 'package:profile_editor/core/constants/app_strings.dart'; 
import 'package:profile_editor/core/extensions/space_extension.dart';
import 'package:profile_editor/core/utils/validators.dart';
import 'package:profile_editor/features/presentation/bloc/profile_bloc.dart';
import 'package:profile_editor/features/presentation/widgets/edit_image_widget.dart';
import 'package:profile_editor/features/profile/data/models/profile_model.dart';
import 'package:profile_editor/widgets/app_button.dart';
import 'package:profile_editor/widgets/app_textfield.dart';

class ProfileForm extends StatefulWidget {
  final ProfileModel? profile;

  const ProfileForm({super.key, required this.profile});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _bioController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _locationController;
  String? _avatarBase64;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.profile?.name);
    _bioController = TextEditingController(text: widget.profile?.bio);
    _emailController = TextEditingController(text: widget.profile?.email);
    _phoneController = TextEditingController(text: widget.profile?.phone);
    _locationController = TextEditingController(text: widget.profile?.city);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
      decoration: BoxDecoration(
        color: AppColors.white,
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
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const ProfileImageWidget(),
            30.0.h,
            AppTextField(
              label: AppStrings.name,
              icon: Icons.person_outline,
              controller: _nameController,
              validator: Validators.validateEmptyField("Name"),
            ),
            16.0.h,
            AppTextField(
              label: AppStrings.email,
              icon: Icons.email_outlined,
              controller: _emailController,
              validator: Validators.validateEmail,
            ),
            16.0.h,
            AppTextField(
              label: AppStrings.phone,
              icon: Icons.phone_android,
              controller: _phoneController,
              validator: Validators.validateEmptyField("Phone"),
              keyboardType: TextInputType.phone,
            ),
            16.0.h,
            AppTextField(
              label: AppStrings.bio,
              icon: Icons.info_outline,
              controller: _bioController,
              maxLines: 2,
            ),
            16.0.h,
            AppTextField(
              label: AppStrings.location,
              icon: Icons.location_on_outlined,
              controller: _locationController,
            ),
            30.0.h,
            AppButton(
              title: "Save",
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  final updatedProfile = ProfileModel(
                    name: _nameController.text,
                    bio: _bioController.text,
                    email: _emailController.text,
                    phone: _phoneController.text,
                    city: _locationController.text,
                    id: widget.profile?.id ?? "3",
                    avatar: _avatarBase64,
                  );
                  GetIt.I<ProfileBloc>().add(
                    UpdateProfileEvent(updatedProfile),
                  );
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
