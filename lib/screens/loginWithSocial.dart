// ignore_for_file: unused_element, unused_local_variable, unused_field

import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginWithSocial extends ChangeNotifier {
  GoogleSignIn googleSignIn = GoogleSignIn();

  GoogleSignInAccount _user;

  GoogleSignInAccount get user => _user;

  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;
    print(user.toString());

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);

    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setString("token", credential.accessToken);
    _pref.setString("userData", user.toString());
    notifyListeners();
  }



  Future github() async {}
  Future facebook() async {}
}
