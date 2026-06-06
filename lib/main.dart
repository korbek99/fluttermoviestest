import 'package:flutter/material.dart';
import 'views/home_view.dart';
import 'package:provider/provider.dart';
import 'viewmodels/MovieViewModel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MovieViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
   
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
     // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const HomeView()
    );
  }
}