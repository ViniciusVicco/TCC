import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tcc/common/data/models/files/file_category_enum.dart';
import 'package:tcc/core/datasource/datasource_response.dart';
import 'package:tcc/features/profile/data/datasources/profile_datasource_abstract.dart';

class ProfileDatasourceImpl implements ProfileDataSourceAbstract {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseDatabase firebaseDatabase;
  ProfileDatasourceImpl(
      {required this.firebaseFirestore, required this.firebaseDatabase});
  @override
  Future<DataSourceResponse> getFileUrl() {
    throw UnimplementedError();
  }

  @override
  Future<DataSourceResponse> uploadFile(
      {required File file,
      required String userUID,
      required FileCategory fileCategory}) async {
    await firebaseDatabase
        .ref("$userUID/${fileCategory.getStringPathFromCategory()}")
        .set(file);

    return DataSourceResponse(data: null, success: true);
  }
}
