import '../enitity/entity.dart';

class UserAuthEntity implements Entity {
  final String uid;
  final String userName;
  final String userEmail;
  final String phone;

  UserAuthEntity(
      {required this.uid,
      required this.userEmail,
      this.userName = "",
      this.phone = ""});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      "uid": uid,
      "userName": userName,
      "userEmail": userEmail,
      "phone": phone
    };
    return data;
  }

  factory UserAuthEntity.fromJson(Map<String, dynamic> json) {
    return UserAuthEntity(
        uid: json['uid'],
        userEmail: json['userName'],
        phone: json['userEmail'],
        userName: json['phone']);
  }
}
