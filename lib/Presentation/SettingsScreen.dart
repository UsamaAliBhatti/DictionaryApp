import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dictionaryapp/Presentation/Resetpassword.dart';
import 'package:dictionaryapp/Utils/Constants.dart';
import 'package:dictionaryapp/Utils/Widgets.dart';
import 'package:dictionaryapp/services/auth_services.dart';
import 'package:dictionaryapp/services/db_services.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage(AppImages.maindashboardimg))),
        child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: DBServices.getUserProgessData(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Container(
                height: height,
                width: width,
                color: AppColors.buttoncolor.withOpacity(.8),
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppImages.hearzerobadgeimg,
                            width: 100,
                            height: 100,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          const Expanded(
                            child: Text(
                              "Settings",
                              style: TextStyle(
                                  fontFamily: "coiny",
                                  fontSize: 31,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              Image.asset(AppImages.personimg),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data!['user_name'],
                                    style: const TextStyle(
                                        fontFamily: "montserrat",
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.white,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    "Level ${snapshot.data!['current_level']}",
                                    style: const TextStyle(
                                        fontFamily: "montserrat",
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.white,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    "Current Score: ${snapshot.data!['current_score']}",
                                    style: const TextStyle(
                                        fontFamily: "montserrat",
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.white,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 120.0),
                        child: SizedBox(
                          width: width * .4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /*  Text(
                                "User Prefences",
                                style: TextStyle(
                                    fontFamily: "montserrat",
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.white,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Language",
                                    style: TextStyle(
                                        fontFamily: "montserrat",
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.white,
                                        fontSize: 12),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: AppColors.white,
                                  )
                                ],
                              ), */
                              /*  Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Notifications",
                                    style: TextStyle(
                                        fontFamily: "montserrat",
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.white,
                                        fontSize: 12),
                                  ),
                                  Icon(
                                    Icons.toggle_on_outlined,
                                    color: AppColors.white,
                                  )
                                ],
                              ), */
                              // Divider(
                              //   color: AppColors.white,
                              //   thickness: 2,
                              // ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Text(
                                "Profile Settings",
                                style: TextStyle(
                                    fontFamily: "montserrat",
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.white,
                                    fontSize: 20),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (_) => AlertDialog(
                                          backgroundColor:
                                              AppColors.alphabetcontainercolor,
                                          title: const TextWithStroke(
                                            text: 'Personal Information',
                                            textStyle: TextStyle(
                                                fontFamily: "coiny",
                                                color: AppColors.white,
                                                fontSize: 35),
                                            strokeWidth: 2.0,
                                            strokeColor: Colors.black,
                                          ),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    'Name:',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "montserrat",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: AppColors.white,
                                                        fontSize: 20),
                                                  ),
                                                  Text(
                                                    snapshot.data!['user_name'],
                                                    style: const TextStyle(
                                                        fontFamily:
                                                            "montserrat",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: AppColors.white,
                                                        fontSize: 20),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    'Email:',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "montserrat",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: AppColors.white,
                                                        fontSize: 20),
                                                  ),
                                                  Text(
                                                    snapshot.data!['email'],
                                                    style: const TextStyle(
                                                        fontFamily:
                                                            "montserrat",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: AppColors.white,
                                                        fontSize: 20),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              )
                                            ],
                                          ),
                                          actions: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 10, right: 10),
                                                decoration: BoxDecoration(
                                                  color: AppColors.textcolor,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  border: Border.all(
                                                    color: AppColors.white,
                                                  ),
                                                ),
                                                child: const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 6.0,
                                                      horizontal: 12),
                                                  child: Text(
                                                    "OKAY",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "montserrat",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: AppColors.white,
                                                        fontSize: 20),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "Profile Information",
                                      style: TextStyle(
                                          fontFamily: "montserrat",
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.white,
                                          fontSize: 12),
                                    ),
                                  ),
                                  const SizedBox()
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              const Resetpasswordpage()));
                                },
                                child: const Text(
                                  "Change Password",
                                  style: TextStyle(
                                      fontFamily: "montserrat",
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.white,
                                      fontSize: 12),
                                ),
                              ),

                              const SizedBox(
                                height: 10,
                              ),
                              /*  Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Privacy Settings",
                                    style: TextStyle(
                                        fontFamily: "montserrat",
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.white,
                                        fontSize: 12),
                                  ),
                                  Icon(
                                    Icons.toggle_on_outlined,
                                    color: AppColors.white,
                                  )
                                ],
                              ), */
                              const Divider(
                                color: AppColors.white,
                                thickness: 2,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 80.0, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 30),
                                decoration: BoxDecoration(
                                  color: AppColors.textcolor,
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: AppColors.white,
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6.0, horizontal: 8),
                                  child: Icon(
                                    Icons.exit_to_app,
                                    size: 32,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  AuthServices.logoutUser(context);
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(left: 30),
                                  decoration: BoxDecoration(
                                    color: AppColors.textcolor,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: AppColors.white,
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 6.0, horizontal: 12),
                                    child: Text(
                                      "Logout",
                                      style: TextStyle(
                                          fontFamily: "montserrat",
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.white,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ]),
              );
            }),
      ),
    );
  }
}
