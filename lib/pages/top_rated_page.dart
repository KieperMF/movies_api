import 'package:flutter/material.dart';
import 'package:movies_api/pages/top_movie.dart';
import 'package:movies_api/requests/top_rated_request.dart';

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
        title: const Text("Melhores Filmes"),
      ),
      body: SingleChildScrollView(
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
                          physics:const BouncingScrollPhysics(),
                          itemCount: topMovies!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                const Padding(padding: EdgeInsets.all(10)),
                                ElevatedButton(
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
                                          "${url.poster}${topMovies![index].poster}"),
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
