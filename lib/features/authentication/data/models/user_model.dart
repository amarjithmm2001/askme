import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  String? email;
  String? name;
  String? password;

  UserModel({
    this.email,
    this.uid,
    this.name,
    this.password,
  });

  factory UserModel.fromJson(DocumentSnapshot data) {
    final Map<String, dynamic> json = data.data() as Map<String, dynamic>;

    return UserModel(
      email: json['email'] ?? '',
      uid: json['uid'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> roJson() {
    return {"uid": uid, "email": email, "name": name};
  }
}
