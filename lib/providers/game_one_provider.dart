import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dictionaryapp/Utils/Constants.dart';
import 'package:dictionaryapp/Utils/Widgets.dart';
import 'package:dictionaryapp/services/db_services.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class GameOneProvider extends ChangeNotifier {
  List<String>? options;
  String? videoLink;
  String? _selectedVal;
  int? _nextLevel;
  bool _isLoading = true;

  String? _correctOption;
  VideoPlayerController? _controller;
  VideoPlayerController? get getController => _controller;

  bool get isLoading => _isLoading;
  int? get nextLevel => _nextLevel;

  setIsLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  String? get correctOption => _correctOption;

  // setLevels(String? current, String next) {
  //   _nextLevel = next;
  //   _currentLevel = current;
  //   notifyListeners();
  // }

  // void setData(Map<String, dynamic> data) {
  //   options = List<String>.from(data['options'] as List);
  //   videoLink = data['video'];
  //   notifyListeners();
  // }

  setSelectedValue(String val) {
    _selectedVal = val;
    notifyListeners();
  }

  getGameData(String id) async {
    setIsLoading(true);
    var data = await DBServices.getGameScreenData(id);
    if (data.exists) {
      options = List<String>.from(data['options'] as List);
      videoLink = data['video'];
      _correctOption = data['correct_option'];
      _nextLevel = data['next_level'];

      _controller = VideoPlayerController.networkUrl(Uri.parse(videoLink!))
        ..initialize().then((value) {
          _controller!.play();
          _controller!.setLooping(true);
          setIsLoading(false);
        });
    }
    notifyListeners();
  }

  String? get getSelectedVal => _selectedVal;

  // uploadLevelResult() {
  //   DBServices.updateGameLevelData(_currentLevel!, _nextLevel!);
  // }

  // showData() {
  //   print(options);
  // }

  List<String> get getOptions => options!;

  clearData() {
    _controller!.dispose();
    setIsLoading(true);
    setSelectedValue('');
    options = [];
  }

  @override
  void dispose() {
    _controller!.dispose();
    // setIsLoading(true);
    // setSelectedValue('');
    // options = [];
    // TODO: implement dispose
    super.dispose();
  }

  showSuccessDialog(
      {required BuildContext context,
      required int completedLevel,
      required int currentLevel,
      required int nextLevel,
      required int progress}) {
    var data = {
      'completed_levels': FieldValue.arrayUnion([
        completedLevel,
      ]),
      'current_level': currentLevel,
      'current_score': progress,
      'next_level': nextLevel,
    };

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
              backgroundColor: Colors.yellow,
              title: const Center(
                child: TextWithStroke(
                  text: 'Congratulations',
                  strokeColor: Colors.black,
                  strokeWidth: 2,
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontFamily: 'coiny',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              content: SizedBox(
                width: MediaQuery.sizeOf(context).width / 2,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const TextWithStroke(
                    text: 'Points Earned',
                    strokeColor: Colors.black,
                    strokeWidth: 2,
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: 'coiny',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextWithStroke(
                    text: '5',
                    strokeColor: Colors.black,
                    strokeWidth: 2,
                    textStyle: TextStyle(
                      fontSize: 40,
                      fontFamily: 'coiny',
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () async {
                      await DBServices.updateGameLevelData(data: data).then(
                          (value) =>
                              {Navigator.pop(context), Navigator.pop(context)});
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.alphabetcontainercolor),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Next Level',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'montserrat'),
                          ),
                          Icon(
                            Icons.navigate_next,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  )
                ]),
              ),
            ));
  }

  showTryAgainDialog({
    required BuildContext context,
  }) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => AlertDialog(
              backgroundColor: Colors.yellow,
              title: const Center(
                child: TextWithStroke(
                  text: 'OOPSY',
                  strokeColor: Colors.black,
                  strokeWidth: 2,
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontFamily: 'coiny',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              content: SizedBox(
                width: MediaQuery.sizeOf(context).width / 2,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const TextWithStroke(
                    text: 'Wrong Answer',
                    strokeColor: Colors.black,
                    strokeWidth: 2,
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: 'coiny',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.alphabetcontainercolor),
                      child: const Text(
                        'Try Again',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'montserrat'),
                      ),
                    ),
                  )
                ]),
              ),
            ));
  }
}
