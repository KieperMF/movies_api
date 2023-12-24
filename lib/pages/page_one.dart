// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_api/model/movies_model.dart';
import 'package:movies_api/model/urlBase_model.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  TextEditingController text = TextEditingController();
  List<Movie>? movies;
  urlBase url = urlBase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pesquisar'),),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.all(16)),
            TextField(
              controller: text,
              decoration: const InputDecoration(hintText: "Vingadores.."),
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
                              '${url.poster}${movies![index].poster}'),
                          height: 300,
                        ),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Titulo: ${movies![index].title}\n ',
                            style:const TextStyle(fontSize: 18),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Sinopse:\n ${movies![index].overview}',
                            style:const TextStyle(fontSize: 18),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(10)),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Data de Lançamento: ${repleceDate(movies![index].release)}',
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
      Uri uri = Uri.parse(
          "${url.urlSeach}$search${url.key}${url.languageBr}");
      final response = await http.get(uri);

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
