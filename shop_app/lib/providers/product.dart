import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  void _setFavValue(bool value) {
    isFavorite = value;
    notifyListeners();
  }

  Future<void> toggleFavoriteStatus(String token, String userId) async {
    final oldStatus = isFavorite;

    isFavorite = !isFavorite;
    notifyListeners();
    final url = Uri.parse(
        'https://flutter-shop-app-5fb83-default-rtdb.firebaseio.com/userFavorites/$userId/$id.json?auth=$token');

    // try catch, catches network errors but not server errors
    try {
      final res = await http.put(
        url,
        body: json.encode(
          isFavorite,
        ),
      );

      // catch server error
      if (res.statusCode >= 400) {
        _setFavValue(oldStatus);
      }
    } catch (err) {
      _setFavValue(oldStatus);
    }
  }
}
