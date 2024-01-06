part of 'actors_movie_bloc.dart';

sealed class ActorsMovieState  {
  const ActorsMovieState();
}

 class ActorsMovieInitial extends ActorsMovieState {}


class ActorsMovieLoaded extends ActorsMovieState {
  final List<Actor> actors;
  ActorsMovieLoaded(this.actors) : super();
  
}



//error de peliculas
class MovieActorsError extends ActorsMovieState {
  final String message;
  MovieActorsError(this.message);
} 


