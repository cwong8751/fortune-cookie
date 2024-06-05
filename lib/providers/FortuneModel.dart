import 'dart:math';

import 'package:flutter/material.dart';

class FortuneModel extends ChangeNotifier {
  String _currentFortune = "";

  final fortunes = [
    "You will find a new friend",
    "You will find a new friend tomorrow",
    "A truly rich life contains love and art in abundance",
    "Accept something that you cannot change",
    "Adventure can be real happiness",
    "Advice is like kissing",
    "Advice, when most needed, is least needed",
    "Spread love everywhere you go",
    "Well done is better than well said",
    "Do one thing every day that scares you"
  ];

  FortuneModel(){
    getRandomFortune();
  }

  String get currentFortune => _currentFortune;

  void getRandomFortune() {
    var random = Random();
    int randNum = random.nextInt(fortunes.length);
    _currentFortune = fortunes[randNum];

    notifyListeners();
  }

  void getNewFortune(){
    getRandomFortune();
  }
}
