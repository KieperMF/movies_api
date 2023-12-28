import 'package:flutter/material.dart';
import 'package:movies_api/requests/top_rated_request.dart';

//tela do filme selecionado na aba de melhores filmes

class TopMovie extends StatefulWidget {
  const TopMovie({super.key});

  @override
  State<TopMovie> createState() => _TopMovieState();
}

class _TopMovieState extends State<TopMovie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Informações"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if(topMovie != null)...[
              const Padding(padding: EdgeInsets.all(10)),
              SizedBox(
                child: Image.network("${url.poster}${topMovie!.background}"),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              Text("Titulo: ${topMovie!.title}", style:const TextStyle(fontSize: 16),),
              const Padding(padding: EdgeInsets.all(10)),
              SizedBox(
                width: 350,
                child: Text("Sinopse: ${topMovie!.overview}", style:const TextStyle(fontSize: 16),),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              Text("Popularidade: ${topMovie!.popularity}", style:const TextStyle(fontSize: 16),),
              const Padding(padding: EdgeInsets.all(10)),
              Text("Data de Lançamento: ${repleceDate(topMovie!.release)}", style:const TextStyle(fontSize: 16),),
            ]
          ],
        ),
      ),
    );
  }
}