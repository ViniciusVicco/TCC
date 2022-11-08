import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tcc/common/data/models/files/file_category_enum.dart';
import 'package:tcc/core/datasource/datasource_response.dart';
import 'package:tcc/features/profile/data/datasources/profile_datasource_abstract.dart';

class ProfileDatasourceImpl implements ProfileDataSourceAbstract {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firabaseStorage;
  ProfileDatasourceImpl(
      {required this.firebaseFirestore, required this.firabaseStorage});

  @override
  Stream<TaskSnapshot> uploadFile(
      {required File file,
      required String userUID,
      required FileCategory fileCategory}) async* {
    final String path = "$userUID/${fileCategory.getStringPathFromCategory()}";
    final folderRef = firabaseStorage.ref().child(path);
    final result = folderRef.putFile(file);
    yield* result.asStream();
  }

  @override
  Future<DataSourceResponse> getFileUrl(
      {required String userUID, required FileCategory fileCategory}) async {
    final String path = "$userUID/${fileCategory.getStringPathFromCategory()}";
    final folderRef = firabaseStorage.ref().child(path);
    final downloadUrl = await folderRef.getDownloadURL();
    if (downloadUrl != null || downloadUrl.isNotEmpty) {
      return DataSourceResponse(data: downloadUrl, success: true);
    } else {
      return DataSourceResponse(data: downloadUrl, success: false);
    }
  }
}
