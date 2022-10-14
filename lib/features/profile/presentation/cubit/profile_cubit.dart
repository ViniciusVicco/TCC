import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tcc/core/session/session_manager.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  //UploadFileUseCaseWithUserUid
  //GetUploadedFileFromUserUid
  final SessionManager sessionManager;

  ProfileCubit({required this.sessionManager}) : super(ProfileInitialState());

  Future<File?> fetchImageFromCamera() async {
    final rawCameraFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (rawCameraFile != null) {
      return File(rawCameraFile.path);
    } else {
      return null;
    }
  }

  Future<File?> fetchImageFromGallery() async {
    final rawGalleryFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (rawGalleryFile != null) {
      return File(rawGalleryFile.path);
    } else {
      return null;
    }
  }
}
