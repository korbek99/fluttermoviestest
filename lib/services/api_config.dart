class ApiConfig {

ApiConfig._();

static const String baseUrl = 'https://api.themoviedb.org/3/movie';
static const String apikey = '34738023d27013e6d1b995443764da44';
static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

static const String popularMovies = '$baseUrl/movie/popular?api_key=$apikey';
static const String topRatedMovies = '$baseUrl/movie/top_rated?api_key=$apikey';

static const String popularMoviesBase = '/movie/popular';
static const String topRatedMoviesBase = '/movie/top_rated';


}