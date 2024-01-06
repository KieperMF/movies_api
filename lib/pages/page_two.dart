import 'package:flutter/material.dart';
import 'package:movies_api/model/urlBase_model.dart';
import 'package:movies_api/pages/movie_page.dart';
import 'package:movies_api/pages/page_one.dart';
import 'package:movies_api/pages/top_rated_page.dart';
import 'package:movies_api/requests/now_playing_request.dart';
import 'package:movies_api/store_now_playing.dart';

//PAGINA DE FILMES EM CARTAZ

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  void initState() {
    super.initState();
    _loadMovies(); 
  }

  final _store = PlayingStore();

  Future<void> _loadMovies() async {
    await _store.request(); 
    setState(() {});
  }

  urlBase url = urlBase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lançamentos",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[800],
      ),
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        child: ListenableBuilder(
            listenable: _store,
            builder: (context, _) {
              if (_store.movies != null && _store.movies!.isNotEmpty) {
                return Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: _store.movies!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            const Padding(padding: EdgeInsets.only(top: 14)),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[900],
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MoviePage(),
                                  ),
                                );
                                movieSelec = _store.movies![index];
                              },
                              child: Image(
                                image: NetworkImage(
                                  "${url.poster}${_store.movies![index].poster}",
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
            
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[800],
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(onPressed: (){
              Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PageOne()));
            }, icon: const Icon(Icons.search), color: Colors.white,),
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Top_Rated()));
            }, icon: const Icon(Icons.star_border), color: Colors.white,)
          ],
        ),
      ),
    );
  }
}
