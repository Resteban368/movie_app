part of 'next_movie_bloc.dart';

sealed class NextMovieState {
  const NextMovieState();
}

 class NextMovieInitial extends NextMovieState {}


class MoviesLoadedNext extends NextMovieState {
  final int page;
  final List<Movie> movies;
  const MoviesLoadedNext(this.movies, this.page) : super();
  
}



//error de peliculas
class MoviesErrorNext extends NextMovieState {
  final String message;
  const MoviesErrorNext(this.message);
} 


