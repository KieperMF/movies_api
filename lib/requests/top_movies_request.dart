import 'dart:convert';

import 'package:movies_api/model/movies_model.dart';
import 'package:movies_api/model/urlBase_model.dart';
import 'package:http/http.dart' as http;

urlBase url = urlBase();
List<Movie>? movies;
nowPlayingRequest() async {
    try {
      Uri uri = Uri.parse("${url.urlTopMovies}${url.key}${url.languageBr}");
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final decode = jsonDecode(response.body)['results'] as List;
        movies = decode.map((json) => Movie.fromJson(json)).toList();
        return movies;
      }
    } catch (e) {
      print("Erro ao carregar dados");
    }
  }