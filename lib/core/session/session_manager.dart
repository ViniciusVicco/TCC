import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:tcc/core/session/user_auth_entity.dart';

class SessionManager {
  Future<void> storeUserSession(UserAuthEntity userAuthEntity) async {
    try {
      final box = await Hive.openBox("session");
      box.add(userAuthEntity.toJson());
    } catch (error) {
      return;
    }
  }

  Future<UserAuthEntity?> getUserSession() async {
    try {
      final boxData = await Hive.openBox("session");
      if (boxData.isNotEmpty) {
        Map rawUserEntity = boxData.getAt(0);
        return UserAuthEntity.fromJson(
            rawUserEntity.map((key, value) => MapEntry(key as String, value)));
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  Future<void> cleanSession() async {
    try {
      await Hive.deleteFromDisk();
    } catch (error) {
      log("SessionManager: $error");
    }
  }
}
