part of 'profile_bloc.dart';

abstract class ProfileEvent  {
  const ProfileEvent();

}

class LoadProfileEvent extends ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  final ProfileModel profile;

  const UpdateProfileEvent(this.profile);
 
}

class UploadProfileImageEvent extends ProfileEvent {}

