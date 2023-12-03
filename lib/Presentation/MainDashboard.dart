import 'package:dictionaryapp/Presentation/Categories/AlphabetSignCategory.dart';
import 'package:dictionaryapp/Presentation/Categories/FamilyDetailScreen.dart';
import 'package:dictionaryapp/Presentation/Categories/industry_detail_screen.dart';

import 'package:dictionaryapp/Presentation/LeaderBoardScreen.dart';
import 'package:dictionaryapp/Presentation/LearningGameScreen.dart';
import 'package:dictionaryapp/Presentation/SettingsScreen.dart';
import 'package:dictionaryapp/Utils/Constants.dart';
import 'package:dictionaryapp/Utils/Widgets.dart';
import 'package:flutter/material.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  TextEditingController searchsignscontroller = TextEditingController();
  FocusNode f = FocusNode();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.only(left: 40),
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage(AppImages.maindashboardimg))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  AppImages.hearzerobadgeimg,
                  width: 100,
                  height: 100,
                ),
                const SizedBox(
                  width: 30,
                ),
                // SizedBox(
                //     width: width * 0.45,
                //     child: Mytextfield(
                //       f: f,
                //       hinttext: "Search Signs",
                //       controler: searchsignscontroller,
                //       bordercolor: AppColors.buttoncolor,
                //       suffixicon: const Icon(Icons.search),
                //     )),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingsScreen()));
                    },
                    icon: const Icon(Icons.settings)),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LeaderBoardScreen()));
                    },
                    icon: const Icon(Icons.leaderboard)),
                /*   IconButton(
                    onPressed: () {
                    
                    },
                    icon: const Icon(Icons.gamepad)), */
                const SizedBox(
                  width: 30,
                ),
              ],
            ),
            TextWithStroke(
              strokeColor: Colors.black,
              strokeWidth: 2,
              textStyle: TextStyle(
                  fontFamily: "coiny",
                  fontSize: 45,
                  color: Colors.orange.shade400,
                  fontWeight: FontWeight.w600),
              text: 'Categories',
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  categorywidget(
                    categoryimg: AppImages.alphabetcategoryimg,
                    categoryname: "Alphabet",
                    ontap: () {
                      f.unfocus();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AlphabetSignCategory()));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const LearningGameScreen()));
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 210,
                          height: 135,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300,
                                  offset: const Offset(
                                    1,
                                    4,
                                  ),
                                  spreadRadius: 1,
                                  blurRadius: 1)
                            ],
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white, width: 3),
                            color: const Color(0xfff7931E),
                          ),
                          child: SizedBox(
                            width: 70,
                            height: 70,
                            child: Image.asset(
                              AppImages.matchingGameImg,
                              height: 70,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextWithStroke(
                          text: 'Matching Game',
                          textStyle: TextStyle(
                              fontFamily: "coiny",
                              fontSize: 30,
                              color: Colors.orange.shade400,
                              fontWeight: FontWeight.bold),
                          strokeWidth: 3,
                          strokeColor: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),

                  /*  categorywidget(
                    categoryimg: AppImages.matchingGameImg,
                    categoryname: "Matching Game",
                    ontap: () {
                      f.unfocus();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AlphabetSignCategory()));
                    },
                  ), */
                  categorywidget(
                    categoryimg: AppImages.familysigncategoryimg,
                    categoryname: "Family signs",
                    ontap: () {
                      f.unfocus();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const FamilydetailScreen()));
                    },
                  ),
                  categorywidget(
                    categoryimg: AppImages.industrysigncategoryimg,
                    categoryname: "Industry signs",
                    ontap: () {
                      f.unfocus();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const IndustryDetailScreen()));
                    },
                  ),
                  const SizedBox(
                    width: 30,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
