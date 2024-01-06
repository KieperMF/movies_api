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
        title: const Text(
          "Informações",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[800],
      ),
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            if (movieSelec != null) ...[
              const Padding(padding: EdgeInsets.all(14)),
              Image.network(
                "${url.poster}${movieSelec!.background}",
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
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
