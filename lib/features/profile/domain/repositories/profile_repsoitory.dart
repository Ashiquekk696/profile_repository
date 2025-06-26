import '../../data/models/profile_model.dart';

abstract class ProfileRepository {
  Future<ProfileModel> getProfile();
  Future<void>  updateProfile(ProfileModel  profile);
   Future<String?> uploadProfileImage();
}