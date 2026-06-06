import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import '../services/MovieService.dart';


class MovieViewModel extends ChangeNotifier {
  final MovieService _service = MovieService();

  List<Movie> popularMovies = [];
  List<Movie> topRatedMovies = [];

  bool isPopularLoading = false;
  bool isTopRatedLoading = false;

String? errorMessage;

  Future<void> loadMovies({ required bool isPopular }) async {
    _setLoading(isPopular, true);
    errorMessage = null; 
    notifyListeners();

    try {
      final endpoint = isPopular ? 'popular' : 'top_rated';
      final results = await _service.fetchMovies(endpoint);

      if (isPopular) {
        popularMovies = results;
      } else {
        topRatedMovies = results;
      }
     
      notifyListeners();
    } catch (e) {
      print('Error fetching movies: $e');
      errorMessage = 'Error fetching movies';
    } finally {
      _setLoading(isPopular, false);
      notifyListeners();
    }
  }

  void _setLoading(bool isPopular, bool value) {
    if (isPopular) {
      isPopularLoading = value;
    } else {
      isTopRatedLoading = value;
    }
  }

  List<Movie> getFilteredPopular(String query) {
    if(query.isEmpty) { return  popularMovies;}
      return  popularMovies
      .where((m)=> m.title.toLowerCase().contains(query.toLowerCase()))
      .toList();
    } 

  List<Movie> getFilteredTopRated(String query) {
    if(query.isEmpty) { return  topRatedMovies;}
      return  topRatedMovies
      .where((m)=> m.title.toLowerCase().contains(query.toLowerCase()))
      .toList();
    } 

}