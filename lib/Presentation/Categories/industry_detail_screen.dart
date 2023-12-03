import 'package:dictionaryapp/Utils/Constants.dart';
import 'package:flutter/material.dart';

class IndustryDetailScreen extends StatefulWidget {
  const IndustryDetailScreen({
    super.key,
  });

  @override
  State<IndustryDetailScreen> createState() => _IndustryDetailScreenState();
}

class _IndustryDetailScreenState extends State<IndustryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.sizeOf(context).height;
    // double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.alphabetcontainercolor,
        body: Container(
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.black, width: 2.0)),
            height: double.infinity,
            width: double.infinity,
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
                    // const TextWithStroke(
                    //   text: 'Industry Sign',
                    //   textStyle: TextStyle(
                    //       fontFamily: "coiny",
                    //       color: AppColors.white,
                    //       fontSize: 35),
                    //   strokeWidth: 5.0,
                    //   strokeColor: Colors.black,
                    // ),
                  ],
                ),
                Expanded(
                    child: Center(
                        child: Image.asset('assets/images/coming_soon.png')))
                // const Spacer(),
                // const Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     // Image and Text widget
                //     // ImageAndTextWidget(
                //     //   imagePath:
                //     //       AppImages.antiimg, // Replace with your image path
                //     //   text: 'Left Text',
                //     // ),

                //     // Space
                //     SizedBox(
                //         width: 20.0), // You can adjust the spacing as needed

                //     // Text and Image widget
                //     TextAndImageWidget(
                //       text: 'Right Text',
                //       imagePath:
                //           AppImages.uncleimg, // Replace with your image path
                //     ),
                //   ],
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // const Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     // Image and Text widget
                //     // ImageAndTextWidget(
                //     //   imagePath:
                //     //       AppImages.antiimg, // Replace with your image path
                //     //   text: 'Left Text',
                //     // ),

                //     // Space
                //     SizedBox(
                //         width: 20.0), // You can adjust the spacing as needed

                //     // Text and Image widget
                //     TextAndImageWidget(
                //       text: 'Right Text',
                //       imagePath:
                //           AppImages.uncleimg, // Replace with your image path
                //     ),
                //   ],
                // ),
                // const Spacer()
              ],
            )));
  }
}
