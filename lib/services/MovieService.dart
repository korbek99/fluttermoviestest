import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';
import 'api_config.dart';

class MovieService {
Future<List<Movie>> fetchMovies(String endpoint) async {
  final url = Uri.parse("${ApiConfig.baseUrl}/$endpoint?api_key=${ApiConfig.apikey}");

  try {
    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final moviesResult = MoviesResult.fromJson(jsonResponse);
      return moviesResult.results;
    } else {
      throw Exception("Failed to load movies: ${response.statusCode}");
    }

  }catch (e){
    print(url);
    print("Error fetching movies: $e");
    rethrow;
  }
 }
}