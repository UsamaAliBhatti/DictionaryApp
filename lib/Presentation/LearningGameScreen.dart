import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dictionaryapp/Presentation/Categories/AlphabetSignCategory.dart';
import 'package:dictionaryapp/Presentation/Categories/MatchingGame.dart';
import 'package:dictionaryapp/Presentation/UserProgressTracking.dart';
import 'package:dictionaryapp/Utils/Constants.dart';
import 'package:dictionaryapp/Utils/utils.dart';
import 'package:dictionaryapp/services/db_services.dart';
import 'package:flutter/material.dart';

class LearningGameScreen extends StatefulWidget {
  const LearningGameScreen({super.key});

  @override
  State<LearningGameScreen> createState() => _LearningGameScreenState();
}

class _LearningGameScreenState extends State<LearningGameScreen> {
  @override
  void initState() {
    super.initState();
  }

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
        child: StreamBuilder<DocumentSnapshot>(
            stream: DBServices.getCurrentUserProgress(),
            builder: (context, streamData) {
              if (!streamData.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (streamData.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              var list =
                  List<int>.from(streamData.data!['completed_levels'] as List);
              return FutureBuilder<QuerySnapshot>(
                  future: DBServices.initializeData(),
                  builder: (context, futureData) {
                    if (!futureData.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (futureData.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    // for (int i = 0; i < futureData.data!.docs.length; i++) {
                    //   Future.delayed(const Duration(milliseconds: 100)).then(
                    //       (value) => print(
                    //           " Value of $i : ${futureData.data!.docs[i].id /* .compareTo(snapshot.data!['current_level']) */}"));
                    // }

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
                              children: [
                                Image.asset(
                                  AppImages.hearzerobadgeimg,
                                  width: 100,
                                  height: 100,
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Matching Game",
                                            style: TextStyle(
                                                fontFamily: "coiny",
                                                fontSize: 35,
                                                color: AppColors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 12.0),
                                            child: Text(
                                              "Current Score: ${streamData.data!['current_score']}",
                                              style: const TextStyle(
                                                  fontFamily: "Montserrat",
                                                  color: AppColors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          )
                                        ],
                                      ),
                                      const Divider(
                                        thickness: 2,
                                        color: AppColors.white,
                                      )
                                    ],
                                  ),
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
                                                  const UserProgressTracking()));
                                    },
                                    child: Image.asset(AppImages.personimg)),
                                const SizedBox(
                                  width: 30,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // const Center(
                            //   child: Text(
                            //     "Tap to reveal the sign & alphabet",
                            //     style: TextStyle(
                            //         fontFamily: "coiny",
                            //         fontSize: 24,
                            //         color: AppColors.textcolor,
                            //         fontWeight: FontWeight.w600),
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              alignment: WrapAlignment.center,
                              children: [
                                for (var data in futureData.data!.docs)
                                  (int.parse(data.id) <
                                          streamData.data!['next_level'])
                                      ? SizedBox(
                                          width: 55,
                                          height: 55,
                                          child: AlphabetWidget(
                                            containercolor: list.contains(
                                                    int.parse(data.id))
                                                ? Colors.green
                                                : AppColors.textcolor,
                                            alphabet: data['alphabet'],
                                            ontap: () {
                                              if (!list.contains(
                                                      int.parse(data.id)) &&
                                                  int.parse(data.id) ==
                                                      streamData.data![
                                                          'current_level']) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            MatchingGameScreen(
                                                                id: data.id,
                                                                currentScore:
                                                                    streamData
                                                                            .data![
                                                                        'current_score'])));
                                              } /* else if (streamData.data![
                                                          'current_level'] !=
                                                      int.parse(data.id) &&
                                                  !list.contains(
                                                      int.parse(data.id))) {
                                                Utils.showToast(
                                                    'This level is currently locked. Please complete the unlocked one first.');
                                              }  */
                                              else {
                                                Utils.showToast(
                                                    'You have already completed the level. Try another one.');
                                              }
                                            },
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            Utils.showToast(
                                                'This level is currently locked. Please complete the unlocked one first.');
                                          },
                                          child: Container(
                                              width: 55,
                                              height: 55,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: AppColors.textcolor,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                      color: AppColors.white,
                                                      width: 3)),
                                              child: const Icon(
                                                Icons.lock,
                                                color: Colors.white,
                                              )),
                                        ),
                              ],
                            ),
                            /*  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (int i = 0; i < 9; i++) ...[
                                AlphabetWidget(
                                  containercolor: AppColors.textcolor,
                                  alphabet: "",
                                  ontap: () {},
                                )
                              ]
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (int i = 9; i < 18; i++) ...[
                                AlphabetWidget(
                                  containercolor: AppColors.textcolor,
                                  alphabet: "",
                                  ontap: () {},
                                )
                              ]
                            ],
                          ),
                        ), */
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 60.0,
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
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
                                        vertical: 6.0, horizontal: 8),
                                    child: Icon(
                                      Icons.exit_to_app,
                                      size: 32,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                          ]),
                    );
                  });
            }),
      ),
    );
  }
/* 
  showCustomDialog(BuildContext context) {
    return showDialog(context: context, builder: (_) => AlertDialog(
      title: "",
    ));
  } */
}
