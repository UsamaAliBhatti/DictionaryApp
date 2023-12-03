
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static showToast(String msg) {
    return Fluttertoast.showToast(msg: msg);
  }

  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  static String? validateName(String name) {
    if (name.isEmpty) {
      return 'Your name is required';
    }

    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Your name is required';
    }
    if (password.length < 8) {
      return 'password must be of 8 characters';
    }

    return null;
  }
}
