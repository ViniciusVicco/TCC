import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tcc/features/profile/domain/repositories/profile_repository_abstract.dart';

import '../../../../common/data/models/files/file_category_enum.dart';
import '../../../../core/failure/abstract_failure.dart';

class UploadFileUseCase {
  ProfileRepositoryAbstract repository;
  UploadFileUseCase({required this.repository});

  Future<Either<Failure, bool>> uploadFile(
      {required File file,
      required String userUID,
      required FileCategory fileCategory}) {
    return repository.uploadFile(
        file: file, userUID: userUID, fileCategory: fileCategory);
  }
}
