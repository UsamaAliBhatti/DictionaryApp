import 'package:dictionaryapp/Utils/Constants.dart';
import 'package:dictionaryapp/Utils/Widgets.dart';
import 'package:dictionaryapp/providers/game_one_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class MatchingGameScreen extends StatefulWidget {
  final String id;

  final int currentScore;
  const MatchingGameScreen(
      {super.key, required this.id, required this.currentScore});

  @override
  State<MatchingGameScreen> createState() => _MatchingGameScreenState();
}

class _MatchingGameScreenState extends State<MatchingGameScreen> {
  @override
  void initState() {
    // TODO: implement initState
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<GameOneProvider>(context, listen: false)
          .getGameData(widget.id);
      // Provider.of<GameOneProvider>(context, listen: false)
      //     .setLevels(widget.id, widget.nextLevel);
    });
    super.initState();
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   context.read<GameOneProvider>().clearData();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<GameOneProvider>(context);
    // provider.setLevels(widget.id, widget.nextLevel);
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
            child: provider.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                                provider.clearData();
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                size: 34,
                                color: AppColors.white,
                              )),
                          const TextWithStroke(
                            text: 'Matching Game',
                            textStyle: TextStyle(
                                fontFamily: "coiny",
                                color: AppColors.white,
                                fontSize: 35),
                            strokeWidth: 5.0,
                            strokeColor: Colors.black,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 400,
                              height: 250,
                              child: provider.getController!.value.isInitialized
                                  ? VideoPlayer(provider.getController!)
                                  : const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                for (int i = 0;
                                    i < provider.getOptions.length;
                                    i++) ...[
                                  InkWell(
                                    onTap: () {
                                      provider.setSelectedValue(
                                          provider.getOptions[i]);
                                      if (provider.getSelectedVal ==
                                          provider.correctOption) {
                                        provider.showSuccessDialog(
                                          context: context,
                                          completedLevel: int.parse(widget.id),
                                          currentLevel: provider.nextLevel!,
                                          progress: widget.currentScore + 5,
                                          nextLevel: provider.nextLevel! + 1,
                                        );
                                      } else {
                                        provider.showTryAgainDialog(
                                            context: context);
                                      }
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 14),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: provider.getSelectedVal ==
                                                      provider.getOptions[i]
                                                  ? Colors.purple
                                                  : Colors.white,
                                              width: 3),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Text(
                                        provider.getOptions[i],
                                        style: TextStyle(
                                            fontFamily: "montserrat",
                                            fontWeight: FontWeight.bold,
                                            color: provider.getSelectedVal ==
                                                    provider.getOptions[i]
                                                ? Colors.purple
                                                : AppColors.white,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ]
                              ],
                            ),
                            const SizedBox()
                          ],
                        ),
                      ),
                      const Spacer()
                    ],
                  )));
  }
}
