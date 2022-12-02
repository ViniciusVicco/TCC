import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:tcc/common/data/models/files/file_category_enum.dart';
import 'package:tcc/core/datasource/datasource_response.dart';

abstract class ProfileDataSourceAbstract {
  Stream<TaskSnapshot> uploadFile(
      {required File file,
      required String userUID,
      required FileCategory fileCategory});
  Future<DataSourceResponse> getFileUrl(
      {required String userUID, required FileCategory fileCategory});
}
