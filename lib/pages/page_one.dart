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
        title: const Text('Pesquisar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.all(16)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(padding: EdgeInsets.only(left: 10)),
                SizedBox(
                  width: 260,
                  child: TextField(
                    controller: text,
                    decoration: const InputDecoration(hintText: "Batman.."),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        httpRequest(text.text);
                      });
                    },
                    child: const Text("Pesquisar")),
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
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Sinopse:\n ${movies![index].overview}',
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                              const Padding(padding: EdgeInsets.all(10)),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Data de Lançamento: ${repleceDate(movies![index].release)}',
                                  style: const TextStyle(fontSize: 18),
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
