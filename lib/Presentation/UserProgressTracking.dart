import 'package:dictionaryapp/Utils/Constants.dart';
import 'package:flutter/material.dart';

class UserProgressTracking extends StatefulWidget {
  const UserProgressTracking({super.key});

  @override
  State<UserProgressTracking> createState() => _UserProgressTrackingState();
}

class _UserProgressTrackingState extends State<UserProgressTracking> {
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.sizeOf(context).height;
    // double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.maindashboardimg))),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: AppColors.buttoncolor.withOpacity(.8),
            padding: const EdgeInsets.only(left: 40),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(AppImages.hearzerobadgeimg),
                      const SizedBox(
                        width: 30,
                      ),
                      const Expanded(
                        child: Text(
                          "User Progress Tracking",
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
                      Image.asset(AppImages.personimg),
                      const SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 120.0),
                    child: Row(
                      children: [
                        Image.asset(AppImages.personimg),
                        const SizedBox(
                          width: 10,
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "@HammadUI123",
                              style: TextStyle(
                                  fontFamily: "montserrat",
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                  fontSize: 18),
                            ),
                            Text(
                              "Level 1",
                              style: TextStyle(
                                  fontFamily: "montserrat",
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                  fontSize: 12),
                            ),
                            Text(
                              "Current Score 2",
                              style: TextStyle(
                                  fontFamily: "montserrat",
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Level",
                              style: TextStyle(
                                  fontFamily: "montserrat",
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                  fontSize: 18),
                            ),
                            Row(
                              children: [
                                for (int i = 0; i < 5; i++) ...[
                                  Container(
                                    width: 25,
                                    margin: const EdgeInsets.only(right: 4),
                                    height: 10,
                                    decoration: BoxDecoration(
                                        color: i == 0
                                            ? AppColors.textcolor
                                            : AppColors.textcolor
                                                .withOpacity(.5),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                  )
                                ]
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Achievement",
                              style: TextStyle(
                                  fontFamily: "montserrat",
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                  fontSize: 18),
                            ),
                            Row(
                              children: [
                                for (int i = 0; i < 5; i++) ...[
                                  Container(
                                    width: 25,
                                    margin: const EdgeInsets.only(right: 4),
                                    height: 10,
                                    decoration: BoxDecoration(
                                        color: i == 0 || i == 1
                                            ? AppColors.textcolor
                                            : AppColors.textcolor
                                                .withOpacity(.5),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                  )
                                ]
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 16),
                    margin:
                        const EdgeInsets.only(left: 200, top: 20, right: 160),
                    decoration: BoxDecoration(
                        color: AppColors.textcolor,
                        border: Border.all(
                          color: AppColors.white,
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Completed\nLevels",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "montserrat",
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                  fontSize: 14),
                            ),
                            Text(
                              "1",
                              style: TextStyle(
                                  fontFamily: "montserrat",
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                  fontSize: 50),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Earned\nBadges",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "montserrat",
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                  fontSize: 14),
                            ),
                            Text(
                              "5",
                              style: TextStyle(
                                  fontFamily: "montserrat",
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                  fontSize: 50),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Completed\nachivements",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "montserrat",
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                  fontSize: 14),
                            ),
                            Text(
                              "2",
                              style: TextStyle(
                                  fontFamily: "montserrat",
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                  fontSize: 50),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ]),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: Container(
          margin: const EdgeInsets.only(left: 30),
          decoration: BoxDecoration(
            color: AppColors.textcolor,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: AppColors.white,
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 8),
            child: Icon(
              Icons.exit_to_app,
              size: 32,
              color: Colors.white,
            ),
          ),
        ));
  }
}
