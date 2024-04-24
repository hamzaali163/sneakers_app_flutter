import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteProvider with ChangeNotifier {
  List<String> items = [];

  // List<String> get items => _items;

  FavouriteProvider() {
    loadItems();
  }

  Future<void> loadItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? storedItems = prefs.getStringList('favorite_items');
    if (storedItems != null) {
      items = storedItems;
      notifyListeners();
    }
  }

  void add(String item) async {
    items.add(item);
    await _saveItems();
    notifyListeners();
  }

  void remove(String item) async {
    items.remove(item);
    await _saveItems();
    notifyListeners();
  }

  Future<void> _saveItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorite_items', items);
  }

  Future<void> deleteItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('favorite_items');
    items.clear(); 
    notifyListeners();
  }
}
