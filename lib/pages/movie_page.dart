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
      appBar: AppBar(
        title: const Text("Informações"),
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (movieSelec != null) ...[
              const Padding(padding: EdgeInsets.all(14)),
               Image.network("${url.poster}${movieSelec!.background}", 
               height: 250,
               ),
              const Padding(padding: EdgeInsets.all(10)),
              Text("Titulo: ${movieSelec!.title}", style:const TextStyle(fontSize: 17),),
              const Padding(padding: EdgeInsets.all(10)),
              Text("Sinopse: ${movieSelec!.overview}", style:const TextStyle(fontSize: 17),),
              const Padding(padding: EdgeInsets.all(10)),
              Text("Data de Lançamento: ${repleceDate(movieSelec!.release)}", style:const TextStyle(fontSize: 17),),
              const Padding(padding: EdgeInsets.all(10)),
              Text("Pontuação de Popularidade: ${movieSelec!.popularity}", style:const TextStyle(fontSize: 17),)
            ],
          ],
        ),
      ),
    );
  }
}
