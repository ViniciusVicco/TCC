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
  Future<DataSourceResponse> uploadFile(
      {required File file,
      required String userUID,
      required FileCategory fileCategory}) async {
    final String path = "$userUID/${fileCategory.getStringPathFromCategory()}";
    final folderRef = firabaseStorage.ref().child(path);
    final response = await folderRef.putFile(file);
    switch (response.state) {
      case TaskState.paused:
        // TODO: Handle this case.
        break;
      case TaskState.running:
        // TODO: Handle this case.
        break;
      case TaskState.success:
        return DataSourceResponse(data: null, success: true);

      case TaskState.canceled:
        // TODO: Handle this case.
        break;
      case TaskState.error:
        return DataSourceResponse(data: null, success: false);
    }
    return DataSourceResponse(data: null, success: true);
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
