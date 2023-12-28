import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_api/model/movies_model.dart';
import 'package:movies_api/model/urlBase_model.dart';

List<Movie>? movies;
urlBase url = urlBase();

httpRequest(String input) async {
    try {
      Uri uri = Uri.parse(
          "${url.urlSeach}${replaceSpacesWithPlus(input)}${url.key}${url.languageBr}");
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final decode = jsonDecode(response.body)['results'] as List;
        movies = decode.map((json) => Movie.fromJson(json)).toList();
        print("foi");
        return movies;
      }
    } catch (e) {
      print(e);
      movies = null;
      return movies;
    }
  }

  String replaceSpacesWithPlus(String inputString) {
    String result = inputString.replaceAll(' ', '+');
    return result;
  }

  String repleceDate(String input) {
    String result = input.replaceAll("-", "/");
    return result;
  }