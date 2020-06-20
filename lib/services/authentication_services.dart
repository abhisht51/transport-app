import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future loginWithEmail(
      {@required String email, @required String password}) async {
    try {
      dynamic user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      
      FirebaseUser user1 = user.user;
      return user1;
    } catch (e) {
      return e.message;
    }
  }

  // Auth Change User Stream 
  Stream<FirebaseUser> get user {
    return _firebaseAuth.onAuthStateChanged;
  }




  Future signUpWithEmail(
      {@required String email, @required String password}) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return authResult != null;
    } catch (e) {
      return e.message;
    }
  }

  // Signout 

  Future signOut() async{
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
      
    }
  }

}
