import 'package:flutter/material.dart';
import 'package:movies_api/pages/page_one.dart';
import 'package:movies_api/pages/page_two.dart';
import 'package:movies_api/pages/top_rated_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context) => const PageTwo(),
        '/search': (context) => const PageOne(),
        '/top_rated': (context) => const Top_Rated(),
        
      },
    );
  }
}
