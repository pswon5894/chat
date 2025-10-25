import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier{
  User? _user;
  User? get user => _user;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      _user = credential.user;
      notifyListeners();

    } catch (e) {
      throw Exception(e);
      }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    _user = null;
    notifyListeners();
  }

  void currentUser(){
    _user = FirebaseAuth.instance.currentUser;
    notifyListeners();
  }
}


