import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:tcc/core/datasource/datasource_response.dart';
import 'package:tcc/core/usecase/use_case.dart';
import 'package:tcc/features/profile/domain/repositories/profile_repository_abstract.dart';

import '../../../../common/data/models/files/file_category_enum.dart';

class UploadFileUseCase implements UseCase {
  ProfileRepositoryAbstract repository;
  UploadFileUseCase({required this.repository});

  Stream<TaskSnapshot> uploadFile(
      {required File file,
      required String userUID,
      required FileCategory fileCategory}) async* {
    yield* repository.uploadFile(
        file: file, userUID: userUID, fileCategory: fileCategory);
  }
}
