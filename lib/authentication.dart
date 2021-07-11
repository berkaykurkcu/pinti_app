import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;


//todo static void register
//todo logout


class AuthService {
  static void signIn(email, password, navigator) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    if (_auth.currentUser?.uid != null) {
      navigator();
    }
  }

  static void register({email, password, navigator}) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (_auth.currentUser?.uid != null) {
      //todo
      navigator();
    }
  }

  static void signOut() async {
    await _auth.signOut();
  }

  static String currentUserUid() {
    return _auth.currentUser!.uid;
  }

  static String? currentUserMail() {
    return _auth.currentUser!.email;
  }

}
