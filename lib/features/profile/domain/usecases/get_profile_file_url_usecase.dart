import 'package:dartz/dartz.dart';
import 'package:tcc/features/profile/domain/repositories/profile_repository_abstract.dart';

import '../../../../common/data/models/files/file_category_enum.dart';
import '../../../../core/failure/abstract_failure.dart';

class GetProfileFileUrlUseCase {
  ProfileRepositoryAbstract repository;
  GetProfileFileUrlUseCase({required this.repository});

  Future<Either<Failure, String>> getFileUrl(
      {required String userUID, required FileCategory fileCategory}) async {
    return repository.getFileUrl(userUID: userUID, fileCategory: fileCategory);
  }
}
