import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/MovieViewModel.dart';
import 'movie_detail_view.dart';
import '../views/loading/loadingView.dart';
import '../../constants/appstrings.dart';

class MovieTopRatedView extends StatefulWidget {
  const MovieTopRatedView({super.key});
  @override
  State<MovieTopRatedView> createState() => _MovieTopRatedState();
}
class _MovieTopRatedState extends State<MovieTopRatedView> {
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<MovieViewModel>().loadMovies(isPopular: false),
    );
  }

 @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MovieViewModel>();
    final movies = viewModel.getFilteredTopRated(_searchQuery);

    return Scaffold(
      appBar: AppBar(
        title: const Text(Appstrings.topRatedMovieTitle),
        backgroundColor: Colors.yellow,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: Appstrings.searchMovies,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ),
      ),
      body: _buildBody(viewModel, movies),
    );
  }


  Widget _buildBody(MovieViewModel viewModel,List movies) {

   if(viewModel.isTopRatedLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if(viewModel.errorMessage != null) {
      return Center(child: Text(viewModel.errorMessage!));
    }

    if(movies.isEmpty) {
      return const Center(child: Text(Appstrings.noMoviesFound));
    }
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return ListTile(
            leading: movie.posterPath != null
              ? Image.network('${Appstrings.imageBaseString}${movie.posterPath}',
                  width: 150,
                  height: 275,
                  fit: BoxFit.cover)
              : const SizedBox(
               width: 150,
               height: 275, 
               child: Icon(Icons.movie)),
          title: Text(
            movie.title,
           style: const TextStyle(fontWeight: FontWeight.bold)
          ),
          subtitle: Text("Votes ⭐  ${movie.voteAverage}"),
          trailing: const Icon(Icons.arrow_forward_ios,size: 14),
          onTap: ()  {
            Navigator.push(
              context,
              // MaterialPageRoute(
              //   builder: (context) => MovieDetailView(movie: movie),
              // ),
               Loadingview.create(
                page: MovieDetailView(movie: movie),
                message: Appstrings.loadingDetails,
              ),
            );
          },
        );
      },
    );
  }

}