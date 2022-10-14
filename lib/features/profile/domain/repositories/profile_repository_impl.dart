import 'package:tcc/common/data/models/files/file_category_enum.dart';
import 'dart:io';

import 'package:tcc/core/failure/abstract_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:tcc/features/profile/data/datasources/profile_datasource_impl.dart';
import 'package:tcc/features/profile/domain/repositories/profile_repository_abstract.dart';

class ProfileRepositoryImpl implements ProfileRepositoryAbstract {
  ProfileRepositoryImpl({required this.profileDatasourceImpl});
  final ProfileDatasourceImpl profileDatasourceImpl;
  @override
  Future<Either<Failure, bool>> uploadFile(
      {required File file,
      required String userUID,
      required FileCategory fileCategory}) {
    // TODO: implement uploadFile
    throw UnimplementedError();
  }
}
