import 'package:dictionaryapp/Presentation/MainDashboard.dart';
import 'package:flutter/material.dart';

import '../services/auth_services.dart';

class LoginProvider extends ChangeNotifier {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  bool _obscureText = true;

  bool get getObscureText => _obscureText;

  bool _isLoading = false;

  bool get getIsLoading => _isLoading;

  showPassword() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  loginUser(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      setLoading(true);
      // Exceptions.showToast(nameController.text);
      var user = await AuthServices.loginUser(
          email: emailController.text, password: passwordController.text);

      if (user!) {
        setLoading(false);
        // Utils.showToast('Logged in successfully');
        if (context.mounted) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MainDashboard()));
        }
      }

      setLoading(false);
    }
  }

  @override
  void dispose() {
    emailController.clear();
    passwordController.clear();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
