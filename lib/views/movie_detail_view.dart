import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import 'package:provider/provider.dart';
import '../../constants/appstrings.dart';


class MovieDetailView extends StatelessWidget {
  final Movie movie;
  const MovieDetailView({super.key, required this.movie});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Appstrings.movieDetailsTitle),
        backgroundColor: Colors.yellow,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (movie.backdropPath != null)
              Image.network('https://image.tmdb.org/t/p/w500${movie.backdropPath}'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(movie.title, 
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                 
                  const SizedBox(height: 8),
                  Text(Appstrings.releaseDate + ': ${movie.releaseDate}'),
                  const SizedBox(height: 8),
                  Text(Appstrings.rating + ': ${movie.voteAverage} (⭐  ${movie.voteCount} votes)'),
                 // subtitle: Text("Votes ⭐  ${movie.voteAverage}")
                  const SizedBox(height: 16),
                  Text(movie.overview),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}