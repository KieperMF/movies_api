import 'dart:convert';

import 'package:movies_api/model/movies_model.dart';
import 'package:movies_api/model/urlBase_model.dart';
import 'package:http/http.dart' as http;


List<Movie>? topMovies;
urlBase url = urlBase();
Movie? topMovie;

TopMoviesRequest() async{
  Uri uri = Uri.parse("${url.urlTopMovies}${url.languageBr}${url.key}");
  final response = await http.get(uri);
  if(response.statusCode == 200){
    final decode = jsonDecode(response.body)['results'] as List;
    topMovies = decode.map((json) => Movie.fromJson(json)).toList();
    return topMovies;
  }
}