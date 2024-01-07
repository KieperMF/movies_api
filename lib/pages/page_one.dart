// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:movies_api/requests/search_request.dart';

//PAGINA DE PESQUISAR FILMES

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  TextEditingController text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pesquisar Filme',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[800],
      ),
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.all(16)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: text,
                    decoration: const InputDecoration(
                        hintText: "Batman...",
                        hintStyle: TextStyle(color: Colors.white)),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      httpRequest(text.text);
                    });
                  },
                  child: const Icon(Icons.search),
                ),
              ],
            ),
            FutureBuilder(
              future: httpRequest(text.text),
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
                              const Padding(padding: EdgeInsets.only(top: 14)),
                              SizedBox(
                                width: 350,
                                child: Column(
                                  children: [
                                    Image(
                                      image: NetworkImage(
                                          '${url.poster}${movies![index].poster}'),
                                      height: 300,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        } else {
                                          return Center(
                                            child: CircularProgressIndicator(
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
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 10)),
                                    Text(
                                      'Titulo: ${movies![index].title}\n ',
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                    Text(
                                      'Sinopse:\n ${movies![index].overview}',
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                    const Padding(padding: EdgeInsets.all(10)),
                                    Text(
                                      'Data de Lançamento: ${repleceDate(movies![index].release)}',
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        });
                  } else if (text.text == "") {
                    return const Text("");
                  } else {
                    return const Text(
                        "Não possuimos esse filme em nosso acervo");
                  }
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
