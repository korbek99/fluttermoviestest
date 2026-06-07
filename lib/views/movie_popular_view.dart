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

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                Loadingview.create(
                  page: MovieDetailView(movie: movie),
                  message: Appstrings.loadingDetails,
                ),
              );
            },
            child: Row(
              children: [
                movie.posterPath != null
                    ? ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                        child: Image.network(
                          '${Appstrings.imageBaseString}${movie.posterPath}',
                          width: 200,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                      )
                    : const SizedBox(
                        width: 210,
                        height: 260,
                        child: Icon(Icons.movie, size: 250),
                      ),
                const SizedBox(width: 16),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          movie.title,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          movie.releaseDate != null ? "Release: ${movie.releaseDate!.split('-')[0]}" : "Release date unknown",
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          movie.overview,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(height: 8),
                        Text("Votes ⭐ ${movie.voteAverage}"),
                      ],
                    ),
                  ),
                ),
                const Padding(padding:  EdgeInsets.only(right: 8),
                child: Icon(Icons.arrow_forward_ios,size: 14,color: Colors.grey,)
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

