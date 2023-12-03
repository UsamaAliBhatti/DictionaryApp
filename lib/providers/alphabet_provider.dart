import 'package:dictionaryapp/services/db_services.dart';
import 'package:flutter/material.dart';

class AlphabetProvider extends ChangeNotifier {
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
    _data = await DBServices.getAlphabetsSigns();
    if (_data != null) {
      setIsLoading(false);
    }
    notifyListeners();
  }
}
