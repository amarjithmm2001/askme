import 'package:askme/features/authentication/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection("users");

  Future<UserCredential> signup(UserModel user) async {
    UserCredential userData = await _auth.createUserWithEmailAndPassword(
        email: user.email.toString(), password: user.password.toString());

    if (userData != null) {
      _userCollection.doc(userData.user!.uid).set(
        {
          'uid' : userData.user!.uid,
          'email' : userData.user!.email,
          "name" : user.name
        },
      );
    }
    return userData;
  }
}
