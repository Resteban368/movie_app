import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/repositories/local_storage_repository.dart';

part 'local_storage_event.dart';
part 'local_storage_state.dart';

class LocalStorageBloc extends Bloc<LocalStorageEvent, LocalStorageState> {
  final LocalStorageRepository repository;

  LocalStorageBloc({required this.repository}) : super(LocalStorageInitial()) {
    on<CheckFavoriteEvent>((event, emit) async {
      try {
        final isFavorite = await repository.isMovieFavorite(event.movieId);
        emit(LocalStorageCheckedFavorite(isFavorite));
      } catch (e) {
        emit(LocalStorageError());
      }
    });

    on<ToggleFavoriteEvent>((event, emit) async {
      try {
        final movie = event.movie;
        final isFavorite = await repository.isMovieFavorite(movie.id);

        if (isFavorite) {
          await repository.toggleFavorite(movie); // Elimina la película de favoritos
        } else {
          await repository.toggleFavorite(movie); // Agrega la película a favoritos
        }

        // Actualiza el estado del bloc para reflejar el cambio inmediatamente
        emit(LocalStorageCheckedFavorite(!isFavorite));

        // Desencadena la carga de la lista actualizada de películas
        add(LoadMoviesEvent(limit: 20, offset: 0));
      } catch (e) {
        emit(LocalStorageError());
      }
    });

    on<LoadMoviesEvent>((event, emit) async {
      try {
        final movies = await repository.loadMovies(
            limit: event.limit, offset: event.offset);

        print('mostramos las peliculas ${movies.length}' );
        emit(LocalStorageLoadedMovies(movies));
      } catch (e) {
        emit(LocalStorageError());
      }
    });
  }
}
