import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserCredential> login(String email, String password) async {
    return await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future signup(String email, String password) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      log('inside auth repository');
      final GoogleSignIn googleSignIn = GoogleSignIn();

      // Check if there's an existing Google sign-in
      GoogleSignInAccount? googleUser = googleSignIn.currentUser;

      googleUser ??= await googleSignIn.signIn();

      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication authentication = await googleUser.authentication;

      OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: authentication.accessToken,
        idToken: authentication.idToken,
      );

      UserCredential userCredential = await auth.signInWithCredential(credential);

      if (userCredential.user != null) {
        log(userCredential.user?.email.toString() ?? 'Null email');
        return userCredential;
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    } catch (error) {
      log('error at google sign in $error');
      return null;
    }
  }
}
