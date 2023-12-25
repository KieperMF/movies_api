import 'package:flutter/material.dart';
import 'package:movies_api/requests/top_movies_request.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Informações"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if(movieSelec != null)...[
              Image(image: NetworkImage(
              "${url.poster}${movieSelec!.poster}"
            )),
            const Padding(padding: EdgeInsets.all(10)),
            Text("Titulo: ${movieSelec!.title}"),
            const Padding(padding: EdgeInsets.all(10)),
            Text("Sinopse: ${movieSelec!.overview}"),
            const Padding(padding: EdgeInsets.all(10)),
            Text("Data de Lançamento: ${repleceDate(movieSelec!.release)}"),
            const Padding(padding: EdgeInsets.all(10)),
            Text("Pontuação de Popularidade: ${movieSelec!.popularity}")
            ],
          ],
        ),
      ),
    );
  }
  
}
