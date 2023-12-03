import 'package:dictionaryapp/Utils/utils.dart';
import 'package:dictionaryapp/services/auth_services.dart';
import 'package:flutter/material.dart';

class ResetPasswordProvider extends ChangeNotifier {
  var emailController = TextEditingController();

  resetPassword(BuildContext context) async {
    if (emailController.text.isNotEmpty) {
      await AuthServices.resetPassword(emailController.text)
          .then((value) => Utils.showToast(value!))
          .whenComplete(() {
        Navigator.pop(context);
      });
    }
  }
}
