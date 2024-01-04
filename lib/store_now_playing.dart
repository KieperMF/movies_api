import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:movies_api/model/movies_model.dart';
import 'package:movies_api/model/urlBase_model.dart';

class PlayingStore extends ChangeNotifier {
  urlBase url = urlBase();
  List<Movie>? movies;
  Future<void> request() async {
    try {
      Uri uri = Uri.parse("${url.urlNowPlaying}${url.key}${url.languageBr}");
      final response = await http.get(uri);

      final decode = jsonDecode(response.body)['results'] as List;
      movies = decode.map((json) => Movie.fromJson(json)).toList();
      print("carregou");
      notifyListeners();
    } catch (e) {
      print("Erro ao carregar informações$e");
      movies = [];
        notifyListeners();
    }
  }
}
