import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_editor/features/profile/data/models/profile_model.dart';
import 'package:profile_editor/features/profile/domain/repositories/profile_repsoitory.dart'; 

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;

  ProfileBloc({required this.profileRepository})
      : super(ProfileState.initial()) {
    on<LoadProfileEvent>(_onLoadProfile);
    on<UpdateProfileEvent>(_onUpdateProfile);
    on<UploadProfileImageEvent>(_onUploadProfileImage);
  }

  Future<void> _onLoadProfile(
    LoadProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(fetchProfileStatus: ApiStatus.loading));

    try {
      final profile = await profileRepository.getProfile();
      emit(state.copyWith(
        profile: profile,
        fetchProfileStatus: ApiStatus.success,
      ));
    } catch (e) {
      log(e.toString());
      emit(
        state.copyWith(
          fetchProfileStatus: ApiStatus.failure,
          errorMessage: e.toString(),
          profile: ProfileModel.empty, // Ensure we have an empty profile
        ),
      );
    }
  }

  Future<void> _onUpdateProfile(
    UpdateProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(editProfileStatus: ApiStatus.loading));

    try {
      await profileRepository.updateProfile(event.profile);
      emit(
        state.copyWith(
          profile: event.profile,
          editProfileStatus: ApiStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          editProfileStatus: ApiStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onUploadProfileImage(
    UploadProfileImageEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(editProfileStatus: ApiStatus.loading));

    try {
      final imageUrl = await profileRepository.uploadProfileImage();
      
      if (imageUrl != null) {
        final updatedProfile = state.profile.copyWith(avatar: imageUrl);
        await profileRepository.updateProfile(updatedProfile);
        
        emit(state.copyWith(
          profile: updatedProfile,
          editProfileStatus: ApiStatus.success,
        ));
      } else {
        emit(state.copyWith(
          editProfileStatus: ApiStatus.failure,
          errorMessage: 'No image selected',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        editProfileStatus: ApiStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}