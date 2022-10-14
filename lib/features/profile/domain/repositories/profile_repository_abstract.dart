import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tcc/common/data/models/files/file_category_enum.dart';
import 'package:tcc/core/failure/abstract_failure.dart';

abstract class ProfileRepositoryAbstract {
  Future<Either<Failure, bool>> uploadFile(
      {required File file,
      required String userUID,
      required FileCategory fileCategory});
}
