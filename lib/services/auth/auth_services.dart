import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sushi/core/cashe_helper.dart';
import 'package:sushi/core/user.dart';
import 'package:sushi/models/user_model.dart';
import 'package:sushi/pages/home_page.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;

  

  // Sign in with email and password
  Future signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((user) {
        if (user.user?.uid != null) {
          UserData.uid = user.user?.uid;
          CacheHelper.saveData(key: "uid", value: user.user?.uid);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        }
      });
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message.toString());
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Email or Password is Wrong"),
        ),
      );
    }
  }

  // Sign up with email and password
  Future signUpWithEmailAndPassword(
      String name, String email, String password, BuildContext context) async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((user) {
        if (user.user?.uid != null) {
          final model = UserModel(name: name, email: email);
          _firebaseFireStore.collection("users").doc(user.user?.uid).set(model.toMap());
          UserData.uid = user.user?.uid;
          CacheHelper.saveData(key: "uid", value: user.user?.uid);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        }
      });
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message.toString());
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.message.toString()),
        ),
      );
    }
  }

  Future<void> signOut() async {
    await UserData.clearUserData();
    await _firebaseAuth.signOut();
  }
}
