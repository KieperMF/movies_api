import 'package:flutter/material.dart';
import 'package:movies_api/model/urlBase_model.dart';
import 'package:movies_api/pages/page_one.dart';
import 'package:movies_api/requests/top_movies_request.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  urlBase url = urlBase();
  @override
  void initState() {
    super.initState();
    nowPlayingRequest();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lançamentos"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PageOne()));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          if (movies != null) ...[
            ListView.builder(
                shrinkWrap: true,
                physics:const BouncingScrollPhysics(),
                itemCount: movies!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        width: 300,
                        child: Image(
                            image: NetworkImage(
                                "${url.poster}${movies![index].poster}")),
                      ),
                      Text(movies![index].title),
                      const Padding(padding: EdgeInsets.all(10)),
                      Text(movies![index].overview),
                    ],
                  );
                }),
          ],
        ],
      )),
    );
  }
  
  repleceDate(String date) {
    String result = date.replaceAll('-', "/");
    return result;
  }
}
