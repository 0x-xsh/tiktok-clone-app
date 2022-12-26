import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String pic;
  String email;
  String uid;

  UserModel({
    required this.name,
    required this.email,
    required this.pic,
    required this.uid,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "uid": uid,
      "pic": pic,
      "email": email,
    };
  }

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
        name: snap['name'],
        email: snap['email'],
        pic: snap['pic'],
        uid: snap['uid']);
  }
}
