import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tcc/common/data/models/files/file_category_enum.dart';
import 'package:tcc/core/failure/abstract_failure.dart';

abstract class ProfileRepositoryAbstract {
  Stream<TaskSnapshot> uploadFile(
      {required File file,
      required String userUID,
      required FileCategory fileCategory});

  Future<Either<Failure, String>> getFileUrl(
      {required String userUID, required FileCategory fileCategory});
}
