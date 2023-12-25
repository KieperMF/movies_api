import 'package:flutter/material.dart';
import 'package:movies_api/model/urlBase_model.dart';
import 'package:movies_api/pages/movie_page.dart';
import 'package:movies_api/pages/page_one.dart';
import 'package:movies_api/requests/top_movies_request.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  initState() {
    super.initState();
    nowPlayingRequest();
    setState(() {});
  }

  urlBase url = urlBase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lançamentos"),
        actions: [
          IconButton(
              onPressed: () {
                nowPlayingRequest();
              },
              icon: const Icon(Icons.refresh)),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PageOne()));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body:Center(
        child: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: nowPlayingRequest(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (movies != null && movies!.isNotEmpty) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: movies!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MoviePage(),
                                  ),
                                );
                                movieSelec = movies![index];
                              },
                              child: Image(
                                image: NetworkImage(
                                  "${url.poster}${movies![index].poster}",
                                ),
                              ),
                            ),
                            Text(movies![index].title, style: const TextStyle(fontSize: 16),),
                            const Padding(padding: EdgeInsets.all(10)),
                          ],
                        );
                      },
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Erro ao carregar filmes")));
                    return const Text("");
                  }
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
      ),
       
    );
  }
}
