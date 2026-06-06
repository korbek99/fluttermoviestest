import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/MovieViewModel.dart';
import 'movie_detail_view.dart';
import '../views/loading/loadingView.dart';
import '../../constants/appstrings.dart';

class MoviePopularView extends StatefulWidget {
  const MoviePopularView({super.key});
  @override
  State<MoviePopularView> createState() => _MoviePopularViewState();
}

class _MoviePopularViewState extends State<MoviePopularView> {
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<MovieViewModel>().loadMovies(isPopular: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MovieViewModel>();
    final movies = viewModel.getFilteredPopular(_searchQuery);

    return Scaffold(
      appBar: AppBar(
        title: const Text(Appstrings.popularMovieTitle),
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

   if(viewModel.isPopularLoading) {
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
              ? Image.network('https://image.tmdb.org/t/p/w500${movie.posterPath}',
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
          onTap: () {
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

