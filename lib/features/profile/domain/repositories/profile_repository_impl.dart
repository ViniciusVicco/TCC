import 'dart:async';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:tcc/common/data/models/files/file_category_enum.dart';
import 'dart:io';

import 'package:tcc/core/failure/abstract_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:tcc/features/profile/data/datasources/profile_datasource_impl.dart';
import 'package:tcc/features/profile/domain/failures/cant_get_profile_file_url_failure.dart';
import 'package:tcc/features/profile/domain/repositories/profile_repository_abstract.dart';

class ProfileRepositoryImpl implements ProfileRepositoryAbstract {
  ProfileRepositoryImpl({required this.dataSource});
  final ProfileDatasourceImpl dataSource;
  @override
  Stream<TaskSnapshot> uploadFile(
      {required File file,
      required String userUID,
      required FileCategory fileCategory}) async* {
    yield* dataSource.uploadFile(
        file: file, userUID: userUID, fileCategory: fileCategory);
  }

  @override
  Future<Either<Failure, String>> getFileUrl(
      {required String userUID, required FileCategory fileCategory}) async {
    try {
      final response = await dataSource.getFileUrl(
          userUID: userUID, fileCategory: fileCategory);
      if (response.success) {
        return Right(response.data);
      } else {
        return Left(CantGetProfileFileUrlFailure());
      }
    } catch (error) {
      return Left(CantGetProfileFileUrlFailure());
    }
  }
}
