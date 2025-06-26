import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:profile_editor/core/services/cloudinary_service.dart';
import 'package:profile_editor/features/profile/data/models/profile_model.dart';
import 'package:profile_editor/features/profile/domain/repositories/profile_repsoitory.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  
  final CloudinaryService _cloudinaryService;
  final _baseUrl = 'https://67289b07270bd0b975567134.mockapi.io/users/3'; 
ProfileRepositoryImpl({required CloudinaryService cloudinaryService}) : _cloudinaryService = cloudinaryService;
  @override
  Future<ProfileModel> getProfile() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return ProfileModel.fromJson(data);
    } else {
      throw Exception('Failed to load profile');
    }
  }

  @override
  Future<void> updateProfile(ProfileModel profile) async {
    log('Updating profile: ${profile.toJson()}');
    final response = await http.put(
      Uri.parse(_baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(profile.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update profile');
    }
  }
 

  @override
  Future<String?> uploadProfileImage() async {
    try {
      return await _cloudinaryService.uploadImage();
    } catch (e) {
      log('Image upload error: $e');
      throw Exception('Failed to upload profile image');
    }
  }
}
