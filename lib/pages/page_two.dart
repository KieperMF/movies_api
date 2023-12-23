import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movies_api/model/movies_model.dart';
import 'package:movies_api/model/urlBase_model.dart';
import 'package:http/http.dart' as http;

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  List<Movie>? movies;
  urlBase url = urlBase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filmes em Cartaz"),
      ),
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }

  nowPlayingRequest() async {
    try {
      url.url = "https://api.themoviedb.org/3/movie/now_playing?";
      Uri uri = Uri.parse("${url.url}${url.key}${url.languageBr}");
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final decode = jsonDecode(response.body)['results'] as List;
        movies = decode.map((json) => Movie.fromJson(json)).toList();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Erro ao carregar dados")));
    }
  }
  repleceDate(String date){
    String result = date.replaceAll('-', "/");
    return result;
  }
}
