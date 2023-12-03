// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dictionaryapp/Presentation/Categories/AlphabetDetailsScreen.dart';
import 'package:dictionaryapp/Utils/Constants.dart';
import 'package:dictionaryapp/Utils/Widgets.dart';
import 'package:dictionaryapp/providers/alphabet_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class AlphabetSignCategory extends StatefulWidget {
  const AlphabetSignCategory({super.key});

  @override
  State<AlphabetSignCategory> createState() => _AlphabetSignCategoryState();
}

class _AlphabetSignCategoryState extends State<AlphabetSignCategory> {
  // final List<String> alphabets = List.generate(
  //     26, (index) => String.fromCharCode('A'.codeUnitAt(0) + index));

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AlphabetProvider>(context, listen: false).initializeData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AlphabetProvider>(context);
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        body: Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.maindashboardimg))),
            child: provider.getIsLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    padding:
                        const EdgeInsets.only(left: 40, top: 12, right: 40),
                    color: const Color(0xffE9CB37).withOpacity(.6),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  size: 34,
                                  color: AppColors.black,
                                )),
                            const TextWithStroke(
                              text: 'Alphabet Signs',
                              textStyle: TextStyle(
                                  fontFamily: "coiny",
                                  color: AppColors.white,
                                  fontSize: 35),
                              strokeWidth: 5.0,
                              strokeColor: Colors.black,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        /*   Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: provider.getData!.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      childAspectRatio: 1),
                              itemBuilder: (_, index) {
                                return AlphabetSignWidget(
                                    imageLink: provider.getData![index]['link'],
                                    containercolor:
                                        AppColors.alphabetcontainercolor,
                                    alphabet: provider.getData![index]
                                        ['alphabet'],
                                    ontap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AlphabetdetailScreen(
                                                    signtext: provider
                                                        .getData![index],
                                                  )));
                                    });
                              }),
                        )), */
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (int i = 0; i < 9; i++) ...[
                              AlphabetWidget(
                                containercolor:
                                    AppColors.alphabetcontainercolor,
                                alphabet: provider.getData![i]['alphabet'],
                                ontap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AlphabetdetailScreen(
                                                signtext: provider.getData![i],
                                              )));
                                },
                              )
                            ]
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (int i = 9; i < 18; i++) ...[
                              AlphabetWidget(
                                containercolor:
                                    AppColors.alphabetcontainercolor,
                                alphabet: provider.getData![i]['alphabet'],
                                ontap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AlphabetdetailScreen(
                                                  signtext:
                                                      provider.getData![i])));
                                },
                              )
                            ]
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: width * .85,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (int i = 18; i < 26; i++) ...[
                                AlphabetWidget(
                                  alphabet: provider.getData![i]['alphabet'],
                                  containercolor:
                                      AppColors.alphabetcontainercolor,
                                  ontap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AlphabetdetailScreen(
                                                    signtext:
                                                        provider.getData![i])));
                                  },
                                )
                              ]
                            ],
                          ),
                        ),
                      ],
                    ),
                  )));
  }
}

class AlphabetWidget extends StatelessWidget {
  final String alphabet;
  final VoidCallback ontap;
  final Color containercolor;
  const AlphabetWidget({
    required this.alphabet,
    required this.ontap,
    required this.containercolor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: 70,
        height: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: containercolor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.white, width: 3)),
        child: TextWithStroke(
          text: alphabet,
          textStyle: const TextStyle(
              fontFamily: "coiny",
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontSize: 40),
          strokeWidth: 5.0,
          strokeColor: Colors.white,
        ),
      ),
    );
  }
}

class AlphabetSignWidget extends StatelessWidget {
  final String alphabet;
  final VoidCallback ontap;
  final String imageLink;
  final Color containercolor;
  const AlphabetSignWidget({
    required this.alphabet,
    required this.ontap,
    required this.containercolor,
    required this.imageLink,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: 100,
        height: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: containercolor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.white, width: 3)),
        child: Stack(
          children: [
            Center(
              child: CachedNetworkImage(
                imageUrl: imageLink,
                width: 80,
                height: 80,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextWithStroke(
                  text: alphabet,
                  textStyle: const TextStyle(
                      fontFamily: "coiny",
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                  strokeWidth: 5.0,
                  strokeColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
