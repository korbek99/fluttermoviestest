import 'package:flutter/material.dart';
import 'views/home/home_view.dart';
import 'package:provider/provider.dart';
import 'viewmodels/MovieViewModel.dart';
import 'views/laucher/launch_view.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  
  // 3. Carga el archivo .env
  await dotenv.load(fileName: ".env");

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
      home: const  LaunchView()
    );
  }
}