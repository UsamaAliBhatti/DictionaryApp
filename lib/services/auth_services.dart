import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dictionaryapp/Presentation/LoginPage.dart';
import 'package:dictionaryapp/Utils/Utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class AuthServices {
  static final _auth = FirebaseAuth.instance;

  static final _database = FirebaseFirestore.instance.collection('Users');
  static final _databaseProgress =
      FirebaseFirestore.instance.collection('users_progress');

  static Future<User?> registerUser(
      {required String name,
      required String email,
      required String password}) async {
    try {
      var userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Utils.showToast('Email already in use. Try another one');
      } else if (e.code == 'weak-password') {
        Utils.showToast(
            'The password is too weak. Please choose a stronger password.');
      } else {
        Utils.showToast('Error: ${e.message}');
      }

      return null;
      // TODO
    }
  }

  static Future<String?> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return 'Password reset email sent to $email.';
    } on FirebaseAuthException catch (e) {
      return 'Error: ${e.message}';
    } catch (e) {
      return null;
    }
  }

  static Future<bool?> loginUser(
      {required String email, required String password}) async {
    try {
      var userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        Utils.showToast('Logged in successfully');
        return true;
      }

      return false;
      // Successful sign-in
    } on FirebaseAuthException catch (e) {
      if (e.code == 'USER-NOT-FOUND') {
        // User does not exist
        Utils.showToast('user does not exist');
        return false;
      } else if (e.code == 'WRONG-PASSWORD') {
        // Incorrect password
        Utils.showToast('Incorrect password');
        return false;
      } else if (e.code == 'INVALID-LOGIN-CREDENTIALS') {
        // Handle other authentication errors
        Utils.showToast("Invalid Credentials");
        return false;
      } else {
        Utils.showToast("Error: ${e.code} ");
        return false;
      }
      
    } on PlatformException catch (e) {
      // Handle other platform exceptions (e.g., network error)
      Utils.showToast("Error: ${e.message}");
      return false;
    } catch (e) {
      // Handle generic exceptions
      Utils.showToast("Error: $e");
      return false;
    }
  }

  static Future saveUserDataToDatabase(User user, String name) async {
    var data = {'id': user.uid, 'name': name, 'email': user.email};
    try {
      await _database.doc(user.uid).set(data).then((value) {
        _databaseProgress.doc(user.uid).set({
          'user_name': name,
          'current_level': 0,
          'next_level': 1,
          'current_score': 0,
          'email': user.email,
          'completed_levels': FieldValue.arrayUnion([])
        }).then((value) => Utils.showToast('Record Added Successfully'));
      });
    } on FirebaseException catch (e) {
      if (e.code == 'cancelled') {
        Utils.showToast('Firestore operation cancelled');
      } else if (e.code == 'unavailable') {
        Utils.showToast('Firestore service is temporarily unavailable');
      } else {
        Utils.showToast('Firestore Error: ${e.message}');
      }
    }
  }

  static logoutUser(BuildContext context) async {
    await _auth.signOut().then((value) => {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
              (route) => false)
        });
  }
}
