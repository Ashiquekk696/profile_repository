part of 'profile_bloc.dart';

enum ApiStatus { initial, loading, success, failure }

class ProfileState  {
  final ApiStatus fetchProfileStatus;
  final ApiStatus editProfileStatus;
  final ProfileModel profile;
  final String? errorMessage;

  const ProfileState({
    required this.fetchProfileStatus,
    required this.editProfileStatus,
    required this.profile,
    this.errorMessage,
  });

  factory ProfileState.initial() {
    return ProfileState(
      fetchProfileStatus: ApiStatus.initial,
      editProfileStatus: ApiStatus.initial,
      profile: ProfileModel.empty,
    );
  }

  ProfileState copyWith({
    ApiStatus? fetchProfileStatus,
    ApiStatus? editProfileStatus,
    ProfileModel? profile,
    String? errorMessage,
  }) {
    return ProfileState(
      fetchProfileStatus: fetchProfileStatus ?? this.fetchProfileStatus,
      editProfileStatus: editProfileStatus ?? this.editProfileStatus,
      profile: profile ?? this.profile,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }


}