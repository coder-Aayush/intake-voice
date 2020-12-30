import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intakeproject/controller/firebase.dart';
import 'package:intakeproject/models/AppUser.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseController _controller = FirebaseController();

  AppUser _user(User user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

  Stream<AppUser> get onAuthChanged => _auth.authStateChanges().map(_user);

  Future<User> loginWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    try {
      final UserCredential user = await _auth
          .signInWithCredential(
        GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        ),
      )
          .then((user) async {
         return await _controller.createNewUser(userid: user.user.uid);
        // create user document using FirebaseController
      });
      return user.user;
    } on FirebaseAuthException catch (e) {
      throw e.message;
    } catch (e) {
      throw e.message;
    }
  }

  logout() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  getUser() {
    return _auth.currentUser;
  }
}

final AuthController authController = AuthController();
