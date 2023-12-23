import 'package:flutter/material.dart';
import 'package:movies_api/pages/page_one.dart';
import 'package:movies_api/pages/page_two.dart';

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
      initialRoute: '/two',
      routes: {
        '/': (context) => const PageOne(),
        '/two':(context) => const PageTwo()
      },
    );
  }
}
