// ignore_for_file: use_build_context_synchronously

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
  TextEditingController text = TextEditingController();
  List<Movie>? movies;
  List<String>? images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.all(16)),
            TextField(
              controller: text,
              decoration: const InputDecoration(hintText: "Movie name"),
            ),
            ElevatedButton(
                onPressed: () {
                  httpRequest();
                },
                child: const Text("Search")),
            if (movies != null) ...[
              ListView.builder(
                  shrinkWrap: true,
                  physics:const BouncingScrollPhysics(),
                  itemCount: movies!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        Image(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/original/${movies![index].poster}'),
                          height: 300,
                        ),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Title: ${movies![index].title}\n ',
                            style:const TextStyle(fontSize: 18),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Overview:\n ${movies![index].overview}',
                            style:const TextStyle(fontSize: 18),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(10)),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Release date: ${repleceDate(movies![index].release)}',
                            style:const TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    );
                  }),
            ],
          ],
        ),
      ),
    );
  }

  httpRequest() async {
    try {
      String moviename = text.text;
      String search = replaceSpacesWithPlus(moviename);
      Uri url = Uri.parse(
          "https://api.themoviedb.org/3/search/movie?query=$search&api_key=65eb24d3d4ad7bfdd3aa23d86fc0cf6a");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final decode = jsonDecode(response.body)['results'] as List;
        movies = decode.map((json) => Movie.fromJson(json)).toList();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Erro ao carregar API")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Não temos esse filme em nosso acervo")));
    }

    setState(() {});
  }

  String replaceSpacesWithPlus(String inputString) {
    String result = inputString.replaceAll(' ', '+');
    return result;
  }

  String repleceDate(String input) {
    String result = input.replaceAll("-", "/");
    return result;
  }
}
