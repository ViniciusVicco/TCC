import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/enitity/entity.dart';

class UserAuthEntity implements Entity {
  final AuthCredential? authCredential;
  final String userName;
  final String userEmail;

  UserAuthEntity(
      {this.authCredential, required this.userEmail, required this.userName});
}
