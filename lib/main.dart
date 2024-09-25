import 'package:flutter/material.dart';
import 'ponies.dart';
import 'myfavorite.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/Ponies': (context) => PoniesScreen(),
        '/MyFavorite': (context) => FavPonyScreen(),
      },
    );
  }
}
