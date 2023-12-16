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
              controller: _text,
              decoration:const InputDecoration(hintText: "Informe um filme"),
            ),
            ElevatedButton(
                onPressed: () {
                  httpRequest();
                },
                child: const Text("Search")),
            if (movies != null  ) ...[
              ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: movies!.length,
                  itemBuilder: (context, index) {
                    Column(
                      children: [
                        Image(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/original/${movies![index].poster}'))
                      ],
                    );

                    return Column(
                      children: [
                        Image(image: NetworkImage('https://image.tmdb.org/t/p/original/${movies![index].poster}')),
                        Text(
                          'Title:\n ${movies![index].title}\n Overview:\n ${movies![index].overview}', style: TextStyle(fontSize: 18),),
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
    String moviename = _text.text;
    Uri url = Uri.parse(
        "https://api.themoviedb.org/3/search/movie?query=${moviename}&api_key=65eb24d3d4ad7bfdd3aa23d86fc0cf6a");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body)['results'] as List;
      movies = decode.map((json) => Movie.fromJson(json)).toList();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Erro ao carregar infos")));
    }
    setState(() {});
  }
}
