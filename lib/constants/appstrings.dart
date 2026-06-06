class Appstrings {

  Appstrings._();

  
  static const String homeTitle = 'home';
  static const String popularTitle = 'popular';
  static const String topRatedTitle = 'top_rated';
  static const String loadingDetails = 'Loading details...';
  static const String noMoviesFound = 'No movies found';
  static const String searchMovies = 'Search movies...';
  static const String releaseDate = 'Release Date';
  static const String rating = 'Rating';
  static const String infoTitle = 'info';

  static const String infobody = '''Este proyecto utiliza el patrón Model-View-ViewModel, el estándar recomendado para Flutter:
Model: Estructuras de datos puras que representan la información de las películas (Entities).
View: Vistas declarativas de Flutter que observan cambios en el estado del ViewModel.
ViewModel: La capa lógica que gestiona las peticiones de red, el procesamiento de datos y expone el estado a la vista.
Service: Capa logica para obtencion de datos desde la api desde (https://api.themoviedb.org).''';


static const String movieDetailsTitle = 'Movie Details';
static const String popularMovieTitle = 'Popular Movies';
static const String topRatedMovieTitle = 'Top Rated Movies';

}