import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataModel extends ChangeNotifier {
  String inputText = '';
  String outputText = 'incomming translation';
  Set<int> favorites = Set();
  List<Converted> list = [];
  List<String> languages = ['Norwegian', 'English', 'French', 'Spanish'];
  String leftLan = 'no';
  String rightLan = 'en';
  String dropDownA = 'Norwegian';
  String dropDownB = 'Norwegian';

  void updateA(newValue){
    dropDownA = newValue;
    switch(dropDownA){
      case 'Norwegian': { leftLan = 'no'; } break;
      case 'English': { leftLan = 'en'; } break;
      case 'French': { leftLan = 'fr'; } break;
      case 'Spanish': { leftLan = 'es'; } break;
    }
    notifyListeners();
  }

  void updateB(newValue){
    dropDownB = newValue;
    switch(dropDownB){
      case 'Norwegian': { rightLan = 'no'; } break;
      case 'English': { rightLan = 'en'; } break;
      case 'French': { rightLan = 'fr'; } break;
      case 'Spanish': { rightLan = 'es'; } break;
    }
    notifyListeners();
  }

  void swapLanguage() {
    var storeA = leftLan;
    var storeB = rightLan;
    var store1 = dropDownA;
    var store2 = dropDownB;

    leftLan = storeB;
    rightLan = storeA;
    dropDownA = store2;
    dropDownB = store1;

    notifyListeners();
  }

  void updateInput(String newValue) {
    inputText = newValue;
    notifyListeners();
  }

  void updateOutput(String newValue) {
    outputText = newValue;
    notifyListeners();
  }

  void updateFavorite(int newFavorite) {
    favorites.add(newFavorite);
    notifyListeners();
  }

  void updateList(Converted listItem) {
    list.add(listItem);
    saveToSharedPreferences();
    notifyListeners();
  }

  void readFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    list = (prefs.getStringList('recent_key')?.map((e) => int.parse(e)).toList()) as List<Converted>;
    notifyListeners();
  }

  void saveToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('recent_key', list.map((e) => e.toString()).toList());
  }
}

class Converted {
  final String translated;
  final String sourceText;
  Converted({required this.translated, required this.sourceText});

  factory Converted.fromJson(Map<String, dynamic> data) {
    final translated = data['translated'] as String;
    final sourceText = data['sourceText'] as String;
    return Converted(translated: translated, sourceText: sourceText);
  }
}
