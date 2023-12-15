import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_api/model/movies_model.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  Movie? movie;
  TextEditingController _text = TextEditingController();
  List<Movie>? movies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _text,
              decoration: InputDecoration(hintText: "Informe um filme"),
            ),
            ElevatedButton(
                onPressed: () {
                  httpRequest();
                },
                child: const Text("Pesquisar")),
          ],
        ),
      ),
    );
  }

  void httpRequest() async {
    String moviename = _text.text;
    Uri url = Uri.parse(
        "https://api.themoviedb.org/3/search/movie?query=${moviename}&api_key=65eb24d3d4ad7bfdd3aa23d86fc0cf6a");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body)['results'] as List;
      decode.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Erro ao carregar infos")));
    }
    setState(() {
      
    });
  }
}
