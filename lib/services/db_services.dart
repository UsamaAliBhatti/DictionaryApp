import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DBServices {
  static final _db = FirebaseFirestore.instance.collection('Family_Signs');
  static final _alphabetDB =
      FirebaseFirestore.instance.collection('alphabet_signs');
  static final _gameOneDB = FirebaseFirestore.instance.collection('game');
  static final _userProgressDB =
      FirebaseFirestore.instance.collection('users_progress');

  static final _auth = FirebaseAuth.instance;

  static Future<List<Map<String, dynamic>>?> getFamilySignsData() async {
    var data = await _db.get();

    return data.docs.map((doc) => doc.data()).toList();
  }

  static Future<List<Map<String, dynamic>>> getAlphabetsSigns() async {
    var data = await _alphabetDB.orderBy('alphabet', descending: false).get();
    return data.docs.map((doc) => doc.data()).toList();
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> initializeData() {
    var data = _gameOneDB.orderBy('alphabet', descending: false).get();
    return data;
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>>
      getCurrentUserProgress() {
    var data =
        _userProgressDB.doc(FirebaseAuth.instance.currentUser!.uid).snapshots();
    return data;
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>> getGameScreenData(
      String id) async {
    var data = await _gameOneDB.doc(id).get();
    return data;
  }

  static Future<void> updateGameLevelData(
      {required Map<String, dynamic> data}) async {
    await _userProgressDB.doc(_auth.currentUser!.uid).update(data);
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>>
      getUserProgessData() async {
    var data = await _userProgressDB.doc(_auth.currentUser!.uid).get();
    return data;
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> getUsersProgressData() async{
   return await _userProgressDB.orderBy('current_score', descending: false).get();
  }
}
