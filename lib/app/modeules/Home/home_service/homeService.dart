import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../../../../common/base_client.dart';
import '../../../../models/books_model.dart';

class HomeService {
  Future<BooksModel> booksListFetch() async {
    BooksModel booksModel = BooksModel();
    debugPrint("https://stephen-king-api.onrender.com/api/books");
    const uri = 'https://stephen-king-api.onrender.com/api/books';
    print(uri);

    try {
      var response = await BaseClient.instance.get(
        uri,
      );
      if (response.statusCode == 200) {
        var parsed = json.decode(utf8.decode(response.bodyBytes));

        debugPrint(parsed.toString());

        booksModel = BooksModel.fromJson(parsed);
      } else if (response.statusCode == 400) {
        var parsed = json.decode(utf8.decode(response.bodyBytes));
        debugPrint(parsed.toString());
      }
    } catch (e) {
      log(e.toString());
    }
    return booksModel;
  }
}