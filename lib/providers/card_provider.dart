import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/card_model.dart';

class CardProvider with ChangeNotifier {
  List<CardModel> cards = [];

  UnmodifiableListView<CardModel> get allCards => UnmodifiableListView(cards);

  void initialState() {
    syncDataWithProvider();
  }

  Future<void> updateSharedPreferences() async {
    List<String> myCards = cards.map((e) => jsonEncode(e.toJson())).toList();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setStringList('cards', myCards);
  }

  void addCard(CardModel _card) {
    cards.add(_card);

    updateSharedPreferences();
    notifyListeners();
  }

  void removeCard(CardModel _card) {
    cards.removeWhere((card) => card.number == _card.number);
    updateSharedPreferences();
    notifyListeners();
  }

  int getCardLength() => cards.length;

  Future syncDataWithProvider() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var result = prefs.getStringList('cards');
    if (result != null) {
      cards = result.map((e) => CardModel.fromJson(json.decode(e))).toList();
    }

    notifyListeners();
  }
}
