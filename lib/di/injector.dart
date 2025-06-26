import 'package:get_it/get_it.dart';
import 'package:profile_editor/core/services/cloudinary_service.dart';
import 'package:profile_editor/features/presentation/bloc/profile_bloc.dart'; 
import 'package:profile_editor/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:profile_editor/features/profile/domain/repositories/profile_repsoitory.dart';
 

final getIt = GetIt.instance;

Future<void> init() async { 
    getIt.registerLazySingleton<CloudinaryService>(() => CloudinaryService());

  getIt
    ..registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl( cloudinaryService: getIt<CloudinaryService>()),
    )
    ..registerLazySingleton<ProfileBloc>(
      () => ProfileBloc(profileRepository: getIt()),
    );
}