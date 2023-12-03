import 'package:dictionaryapp/services/db_services.dart';
import 'package:flutter/material.dart';

class FamilySignsProvider extends ChangeNotifier {
  List<Map<String, dynamic>>? _data;

  List<Map<String, dynamic>>? get getData => _data;

  bool _isLoading = true;
  get getIsLoading => _isLoading;

  setIsLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  initializeData() async {
    setIsLoading(true);
    _data = await DBServices.getFamilySignsData();
    if (_data != null) {
      setIsLoading(false);
    }
    notifyListeners();
  }

  // VideoPlayerController? _controller;

  // VideoPlayerController? get controller => _controller;

  // FamilySignsProvider();

  // void initializeController(String videoUrl) {
  //   _controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
  //     ..initialize().then((_) {
  //       _controller!.setVolume(1.0); // Set volume to max
  //       _controller!.play(); // Start playing the video automatically
  //       notifyListeners();
  //     });
  // }

  // @override
  // void dispose() {
  //   _controller?.dispose();
  //   _controller = null;
  //   notifyListeners();
  // }
}
