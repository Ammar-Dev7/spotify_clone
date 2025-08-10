import 'package:spotify/domain/entities/user_entity.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel extends UserEntity {
   UserModel({
      String super.uid,
    required String email,
    required String username,
  }) : super( email: email, username: username);


  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      username: map['username'] ?? '',
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
    };
  }

}
