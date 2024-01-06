import 'package:flutter/material.dart';
import 'package:movies_api/pages/top_movie.dart';
import 'package:movies_api/requests/top_rated_request.dart';

//PAGINA DE FILMES MAIS BEM AVALIADOS

class Top_Rated extends StatefulWidget {
  const Top_Rated({super.key});

  @override
  State<Top_Rated> createState() => _Top_RatedState();
}

class _Top_RatedState extends State<Top_Rated> {
  @override
  void initState() {
    super.initState();
    TopMoviesRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Melhores Filmes",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[800],
      ),
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FutureBuilder(
                    future: TopMoviesRequest(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (topMovies != null) {
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: topMovies!.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    const Padding(padding: EdgeInsets.all(10)),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.grey[900],
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const TopMovie()));
                                          topMovie = topMovies![index];
                                        },
                                        child: Image(
                                          image: NetworkImage(
                                            "${url.poster}${topMovies![index].poster}",
                                          ),
                                          loadingBuilder: (context, child,
                                              loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            } else {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  value: loadingProgress
                                                              .expectedTotalBytes !=
                                                          null
                                                      ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          (loadingProgress
                                                                  .expectedTotalBytes ??
                                                              1)
                                                      : null,
                                                ),
                                              );
                                            }
                                          },
                                        )),
                                    const Padding(padding: EdgeInsets.all(10)),
                                  ],
                                );
                              });
                        } else {
                          return const Text("Erro ao carregar informações");
                        }
                      } else {
                        return const CircularProgressIndicator();
                      }
                    })
              ],
            ),
          )),
    );
  }
}
