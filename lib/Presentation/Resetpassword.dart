import 'package:dictionaryapp/Utils/Widgets.dart';
import 'package:dictionaryapp/providers/reset_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Utils/Constants.dart';

class Resetpasswordpage extends StatefulWidget {
  const Resetpasswordpage({super.key});

  @override
  State<Resetpasswordpage> createState() => _ResetpasswordpageState();
}

class _ResetpasswordpageState extends State<Resetpasswordpage> {
  @override
  Widget build(BuildContext context) {
    var resetPasswordProvider = Provider.of<ResetPasswordProvider>(context);
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
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const TextWithStroke(
                    text: "Forgot Password",
                    textStyle:
                        TextStyle(fontSize: 54, color: AppColors.textcolor),
                    strokeWidth: 2.0,
                    strokeColor: AppColors.black),
                const Text(
                  "Enter your email to reset your password",
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
                      Column(
                        children: [
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: width * 0.52,
                                  child: Mytextfield(
                                    hinttext: "Email",
                                    controler:
                                        resetPasswordProvider.emailController,
                                  )),
                            ],
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
                                resetPasswordProvider.resetPassword(context);
                              },
                              child: const Text(
                                "Send reset link",
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
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Back to Log In? Log In",
                              style: TextStyle(
                                  fontFamily: "montserrat",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          const Spacer(),
                        ],
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
