import 'package:dictionaryapp/Presentation/MainDashboard.dart';
import 'package:dictionaryapp/Utils/utils.dart';
import 'package:dictionaryapp/services/auth_services.dart';
import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
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

  registerUser(BuildContext context) async {
   

    if (formKey.currentState!.validate()) {
       setLoading(true);
      // Exceptions.showToast(nameController.text);
      var user = await AuthServices.registerUser(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text);
      if (user != null) {
        setLoading(false);
        await AuthServices.saveUserDataToDatabase(user, nameController.text)
            .then((value) {
          Utils.showToast('Record added successfully');
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const MainDashboard()),
              (route) => false);
        });
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
