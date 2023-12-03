import 'package:dictionaryapp/Presentation/LoginPage.dart';
import 'package:dictionaryapp/Utils/utils.dart';
import 'package:dictionaryapp/providers/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Utils/Constants.dart';
import '../Utils/Widgets.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    var signupProvider = Provider.of<SignUpProvider>(context);
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
            child: signupProvider.getIsLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      const TextWithStroke(
                          text: "Sign up",
                          textStyle: TextStyle(
                              fontSize: 54, color: AppColors.textcolor),
                          strokeWidth: 2.0,
                          strokeColor: AppColors.black),
                      const Text(
                        "Create an account",
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
                              key: signupProvider.formKey,
                              child: Column(
                                children: [
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          width: width * 0.25,
                                          child: Mytextfield(
                                            hinttext: "Full Name",
                                            controler:
                                                signupProvider.nameController,
                                            validator: (value) =>
                                                Utils.validateName(value!),
                                          )),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      SizedBox(
                                          width: width * 0.25,
                                          child: Mytextfield(
                                            hinttext: "Email",
                                            validator: (value) =>
                                                Utils.validateEmail(value!),
                                            controler:
                                                signupProvider.emailController,
                                          )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    width: width * 0.52,
                                    child: MypasswordTextfield(
                                      onTap: () =>
                                          signupProvider.showPassword(),
                                      obscureText:
                                          signupProvider.getObscureText,
                                      validator: (value) =>
                                          Utils.validatePassword(value!),
                                      controller:
                                          signupProvider.passwordController,
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
                                        signupProvider.registerUser(context);
                                      },
                                      child: const Text(
                                        "Sign Up",
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontFamily: "montserrat",
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginPage()));
                                    },
                                    child: const Text(
                                      "Already have an account? Log In",
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
