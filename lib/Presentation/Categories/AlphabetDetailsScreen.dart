// import 'package:dictionaryapp/Presentation/Categories/MatchingGame.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dictionaryapp/Utils/Constants.dart';
import 'package:dictionaryapp/Utils/Widgets.dart';
import 'package:flutter/material.dart';

class AlphabetdetailScreen extends StatefulWidget {
  final Map<String, dynamic> signtext;
  const AlphabetdetailScreen({super.key, required this.signtext});

  @override
  State<AlphabetdetailScreen> createState() => _AlphabetdetailScreenState();
}

class _AlphabetdetailScreenState extends State<AlphabetdetailScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.alphabetcontainercolor,
        body: Container(
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.black, width: 2.0)),
            height: height,
            width: width,
            child: Column(
              mainAxisSize: MainAxisSize.max,
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
                          color: AppColors.white,
                        )),
                    TextWithStroke(
                      text: 'Alphabet ${widget.signtext['alphabet']} Sign',
                      textStyle: const TextStyle(
                          fontFamily: "coiny",
                          color: AppColors.white,
                          fontSize: 35),
                      strokeWidth: 2.0,
                      strokeColor: Colors.black,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 1,
                ),
                Center(
                  child: CachedNetworkImage(
                    imageUrl: widget.signtext['link'],
                    width: 200,
                    height: 250,
                    placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator.adaptive()),
                  ),
                ),
                /*  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 150,
                          height: 180,
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: CachedNetworkImage(
                            imageUrl: widget.signtext['example_image'],
                            width: 150,
                            height: 180,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator.adaptive()),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CachedNetworkImage(
                              imageUrl: widget.signtext['link'],
                              width: 100,
                              height: 100,
                              placeholder: (context, url) => const Center(
                                  child: Center(
                                      child: CircularProgressIndicator())),
                            ),
                            InkWell(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (_) => const MatchingGameScreen()));
                              },
                              child: TextWithStroke(
                                text: widget.signtext['alphabet'],
                                textStyle: const TextStyle(
                                    textBaseline: TextBaseline.ideographic,
                                    fontFamily: "montserrat",
                                    fontWeight: FontWeight.w900,
                                    color: AppColors.black,
                                    fontSize: 60),
                                strokeWidth: 2.0,
                                strokeColor: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    CachedNetworkImage(
                      imageUrl: widget.signtext['image'],
                      width: 500,
                      height: 280,
                      fit: BoxFit.contain,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    )
                  ],
                ) */
              ],
            )));
  }
}
/* 
 const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      widget.signtext['link'],
                      width: 100,
                      height: 100,
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (_) => const MatchingGameScreen()));
                      },
                      child: TextWithStroke(
                        text: widget.signtext['alphabet'],
                        textStyle: const TextStyle(
                            fontFamily: "montserrat",
                            fontWeight: FontWeight.w900,
                            color: AppColors.black,
                            fontSize: 100),
                        strokeWidth: 2.0,
                        strokeColor: Colors.white,
                      ),
                    ),
                    Image.network(
                      widget.signtext['example_image'],
                      width: 150,
                      height: 250,
                    ),
                  ],
                ),
                const Spacer() */