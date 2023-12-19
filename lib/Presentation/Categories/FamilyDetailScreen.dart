import 'package:dictionaryapp/Utils/Constants.dart';
import 'package:dictionaryapp/Utils/Widgets.dart';
import 'package:dictionaryapp/providers/family_signs_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class FamilydetailScreen extends StatefulWidget {
  const FamilydetailScreen({
    super.key,
  });

  @override
  State<FamilydetailScreen> createState() => _FamilydetailScreenState();
}

class _FamilydetailScreenState extends State<FamilydetailScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FamilySignsProvider>(context, listen: false).initializeData();
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage(AppImages.familySignsGlossaryImg), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FamilySignsProvider>(context);
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        backgroundColor: AppColors.alphabetcontainercolor,
        body: Container(
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.black, width: 2.0)),
            height: height,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 34,
                          color: AppColors.black,
                        )),
                    const TextWithStroke(
                      text: 'Family Signs',
                      textStyle: TextStyle(
                          fontFamily: "coiny",
                          height: 0.8,
                          color: AppColors.white,
                          fontSize: 35),
                      strokeWidth: 5.0,
                      strokeColor: Colors.black,
                    ),
                  ],
                ),
                provider.getIsLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(15),
                            scrollDirection: Axis.horizontal,
                            itemCount: provider.getData!.length,
                            itemBuilder: (_, index) {
                              return TextAndImageWidget(
                                text: provider.getData![index]['sign_name'],
                                imagePath: provider.getData![index]
                                    ['sign_link'],
                              );
                            }),
                      )
              ],
            )));
  }
}
/*  Center(
                              child: Image.asset(
                                AppImages.familySignsGlossaryImg,
                                width: 400,
                                height: 300,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ), */