import 'package:dictionaryapp/Presentation/Resetpassword.dart';
import 'package:dictionaryapp/Utils/utils.dart';
import 'package:dictionaryapp/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Utils/Constants.dart';
import '../Utils/Widgets.dart';
import 'SignupPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var loginProvider = Provider.of<LoginProvider>(context);

    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.primarycolor,
        body: Container(
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.black, width: 2.0)),
            height: height,
            width: width,
            child: loginProvider.getIsLoading
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : Column(
                    children: [
                      const TextWithStroke(
                          text: "Log in",
                          textStyle: TextStyle(
                              fontSize: 54, color: AppColors.textcolor),
                          strokeWidth: 2.0,
                          strokeColor: AppColors.black),
                      const Text(
                        "Log in to your account",
                        style: TextStyle(
                            fontFamily: "montserrat",
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Spacer(),
                                Image.asset(AppImages.antiimg),
                              ],
                            ),
                            Form(
                              key: loginProvider.formKey,
                              child: Column(
                                children: [
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          width: width * 0.25,
                                          child: Mytextfield(
                                            hinttext: "Email",
                                            controler:
                                                loginProvider.emailController,
                                            validator: (email) =>
                                                Utils.validateEmail(email!),
                                          )),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      SizedBox(
                                          width: width * 0.25,
                                          child: MypasswordTextfield(
                                            onTap: () =>
                                                loginProvider.showPassword(),
                                            obscureText:
                                                loginProvider.getObscureText,
                                            controller: loginProvider
                                                .passwordController,
                                            validator: (value) =>
                                                Utils.validatePassword(value!),
                                          )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    width: width * 0.52,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Spacer(),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Resetpasswordpage()));
                                          },
                                          child: const Text(
                                            "Forget password?",
                                            style: TextStyle(
                                                fontFamily: "montserrat",
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    width: width * 0.52,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                          AppColors
                                              .buttoncolor, // Change this color to the desired one
                                        ),
                                      ),
                                      onPressed: () {
                                        loginProvider.loginUser(context);
                                      },
                                      child: const Text(
                                        "Log in",
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontFamily: "montserrat",
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignupPage()));
                                    },
                                    child: const Text(
                                      "Don't have an account? Sign Up",
                                      style: TextStyle(
                                          fontFamily: "montserrat",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                const Spacer(),
                                Image.asset(AppImages.uncleimg),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )));
  }
}
