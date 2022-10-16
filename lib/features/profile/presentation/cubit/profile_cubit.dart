import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tcc/common/data/models/files/file_category_enum.dart';
import 'package:tcc/core/session/session_manager.dart';

import '../../domain/usecases/get_profile_file_url_usecase.dart';
import '../../domain/usecases/upload_profile_file_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final UploadFileUseCase uploadFileUseCase;
  //GetUploadedFileFromUserUid
  final SessionManager sessionManager;
  final GetProfileFileUrlUseCase getProfileFileUrlUseCase;

  ProfileCubit(
      {required this.uploadFileUseCase,
      required this.sessionManager,
      required this.getProfileFileUrlUseCase})
      : super(ProfileInitialState());

  Future<void> uploadFile(File file) async {
    final userInfo = await sessionManager.getUserSession();
    if (userInfo != null) {
      uploadFileUseCase.uploadFile(
          file: file,
          userUID: userInfo.uid,
          fileCategory: FileCategory.profile);
    }
    await reloadPageInfo();
  }

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

  Future<void> reloadPageInfo() async {
    await getFileUrlProfile();
  }

  Future<void> getFileUrlProfile() async {
    final userInfo = await sessionManager.getUserSession();
    emit(const ProfileLoadingState());
    if (userInfo != null) {
      final response = await getProfileFileUrlUseCase.getFileUrl(
          userUID: userInfo.uid, fileCategory: FileCategory.profile);
      response.fold((failure) {
        emit(const ProfileInitialState(profileUrlImage: ""));
      }, (urlFromProfile) {
        emit(ProfileInitialState(profileUrlImage: urlFromProfile));
      });
    }
  }
}
