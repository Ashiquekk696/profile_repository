 

import 'package:cloudinary/cloudinary.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; 

class CloudinaryService { 
  final cloudinary = Cloudinary.signedConfig(
    cloudName: dotenv.env['cloudName']??"",
    apiKey:dotenv.env['apiKey']??"",
    apiSecret: dotenv.env['apiSecret']??"", 
  );
Future<String?> uploadImage() async {
  try {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
      allowMultiple: false,
    );

    if (result == null || result.files.isEmpty) return null;

    final file = result.files.first;
    final fileBytes = file.bytes; 
    if (fileBytes == null) return null;

    final response = await cloudinary.upload(
      fileBytes: fileBytes,  
      resourceType: CloudinaryResourceType.image,
      fileName: file.name,
      folder: 'profile_images',
    );

    if (response.isSuccessful) {
      return response.secureUrl;
    } else {
      throw Exception('Upload failed: ${response.error}');
    }
  } catch (e) {
    throw Exception('Image upload error: $e');
  }
}
}

