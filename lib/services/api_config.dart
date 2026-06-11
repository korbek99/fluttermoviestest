
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  ApiConfig._();

  static String get apikey => dotenv.env['TMDB_API_KEY'] ?? '';

  static const String baseUrl = 'https://api.themoviedb.org/3/movie'; 
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

 
  static String get popularMovies => '$baseUrl/movie/popular?api_key=$apikey';
  static String get topRatedMovies => '$baseUrl/movie/top_rated?api_key=$apikey';

 
  static const String popularMoviesBase = '/movie/popular';
  static const String topRatedMoviesBase = '/movie/top_rated';

  
}