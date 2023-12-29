import 'package:flutter/material.dart';
import 'package:movies_api/requests/now_playing_request.dart';

//tela do filme selecionado na aba de lançamentos

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
        title: const Text("Informações", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueGrey[900],
      ),
      backgroundColor: Colors.grey[800],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            if (movieSelec != null) ...[
              const Padding(padding: EdgeInsets.all(14)),
              Image.network(
                "${url.poster}${movieSelec!.background}",
                height: 250,
              ),
              const Padding(padding: EdgeInsets.all(10)),
              SizedBox(
                width: 350,
                child: Text(
                  "Titulo: ${movieSelec!.title}",
                  style: const TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              SizedBox(
                width: 350,
                child: Text(
                  "Sinopse: ${movieSelec!.overview}",
                  style: const TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              SizedBox(
                width: 350,
                child: Text(
                  "Data de Lançamento: ${repleceDate(movieSelec!.release)}",
                  style: const TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              SizedBox(
                  width: 350,
                  child: Text(
                    "Pontuação de Popularidade: ${movieSelec!.popularity}",
                    style: const TextStyle(fontSize: 17, color: Colors.white),
                  ))
            ],
          ],
        ),
      ),
    );
  }
}
