import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dictionaryapp/Utils/Constants.dart';
import 'package:dictionaryapp/services/db_services.dart';
import 'package:flutter/material.dart';

class LeaderBoardScreen extends StatefulWidget {
  const LeaderBoardScreen({super.key});

  @override
  State<LeaderBoardScreen> createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        body: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.maindashboardimg))),
          child: Container(
            height: height,
            width: width,
            color: AppColors.buttoncolor.withOpacity(.8),
            padding: const EdgeInsets.only(left: 40),
            child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
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
                  return Column(
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
                                        "LeaderBoard",
                                        style: TextStyle(
                                            fontFamily: "coiny",
                                            fontSize: 35,
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 12.0),
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
                            /*    InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const UserProgressTracking()));
                                },
                                child: */
                            Image.asset(AppImages.personimg),
                            // ),
                            const SizedBox(
                              width: 30,
                            ),
                          ],
                        ),
                        FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                            future: DBServices.getUsersProgressData(),
                            builder: (context, futureData) {
                              if (!futureData.hasData) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (futureData.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return Expanded(
                                  child: ListView.builder(
                                reverse: true,
                                itemCount: futureData.data!.docs.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 35),
                                    decoration: BoxDecoration(
                                        color: AppColors.textcolor,
                                        border: Border.all(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: ListTile(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(
                                            width: 40,
                                          ),
                                          Text(
                                            futureData.data!.docs[index]
                                                ['user_name'],
                                            style: const TextStyle(
                                                fontFamily: "montserrat",
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.white,
                                                fontSize: 18),
                                          ),
                                          const Spacer(),
                                          Text(
                                            "Current Score: ${futureData.data!.docs[index]['current_score']}",
                                            style: const TextStyle(
                                                fontFamily: "montserrat",
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.white,
                                                fontSize: 18),
                                          ),
                                          const SizedBox(
                                            width: 40,
                                          )
                                        ],
                                      ),
                                      trailing: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(AppImages.personimg),
                                      ),
                                    ),
                                  );
                                },
                              ));
                            })
                      ]);
                }),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: InkWell(
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
              padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 8),
              child: Icon(
                Icons.exit_to_app,
                size: 32,
                color: Colors.white,
              ),
            ),
          ),
        ));
  }
}
