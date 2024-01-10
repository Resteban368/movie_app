// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/config/constants/enviroment.dart';
import 'package:movie_app/infrastructure/datasources/moviedb_datasource.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/infrastructure/mappers/movie_mapper.dart';
import 'package:movie_app/infrastructure/models/moviedb/movie_details.dart';

import 'moviedb_datasource_test.mocks.dart';

class MockDio extends Mock implements Dio {}

@GenerateMocks([MoviedbDatasource])
void main() {
  MockMoviedbDatasource mockMoviedbDatasource = MockMoviedbDatasource();

  group('MoviedbDatasource', () {
    late MockDio mockDio;
    late MoviedbDatasource datasource;

    Environment.load();

    setUp(() {
      mockDio = MockDio();
      datasource = MoviedbDatasource(dioInitial: mockDio);
    });
    group('getNowPlaying', () {
      test('returns a list of movies on successful response', () async {
        when(mockMoviedbDatasource.getNowPlaying())
            .thenAnswer((_) async => <Movie>[
                  Movie(
                      adult: false,
                      backdropPath: "/r9oTasGQofvkQY5vlUXglneF64Z.jpg",
                      genreIds: ['28', '35'],
                      id: 1029575,
                      originalLanguage: "en",
                      originalTitle: "The Family Plan",
                      overview:
                          "Dan Morgan es un hombre con muchas identidades: es un esposo devoto, un padre amoroso y un reconocido vendedor de autos.",
                      popularity: 3089.182,
                      posterPath: "/7mEX07jWRYrjarW84sBeFghGMfa.jpg",
                      releaseDate: DateTime(2023, 12, 14),
                      title: "Plan familiar",
                      video: false,
                      voteAverage: 7.398,
                      voteCount: 637)
                ]);

        final movies = await datasource.getNowPlaying();
        expect(movies, isA<List<Movie>>());
        expect(
            movies.isNotEmpty, isTrue); // Verifica que la lista no esté vacía
      });

      test('throws a DioError on unsuccessful response', () async {
        when(mockMoviedbDatasource.getNowPlaying()).thenThrow(
          DioError(
            requestOptions: RequestOptions(path: ''),
            response: Response(
              statusCode: 404,
              requestOptions: RequestOptions(path: ''),
            ),
          ),
        );

        // Utiliza expectLater para manejar excepciones asincrónicas
        await expectLater(
          () => mockMoviedbDatasource.getNowPlaying(),
          throwsA(isA<
              DioError>()), // Puedes personalizar el tipo de excepción esperada
        );
      });
// test('handles DioError on network errors', () async {
//   // Simula un tiempo de espera agotado
//   when(mockMoviedbDatasource.getNowPlaying())
//       .thenThrow(DioError(
//         requestOptions: RequestOptions(path: ''),
//         type: DioErrorType.connectionTimeout,
//         error: 'Connection timeout',
//       ));

//   // Ejecuta la función y espera que lance una excepción DioError de tiempo de espera agotado
//   expect(() async => await datasource.getNowPlaying(),
//       throwsA(isA<DioError>().having((e) => e.type, 'type', DioErrorType.connectionTimeout)));
// });



    });

    group('getMovieByiD', () {
      test('returns a movie on successful response', () async {
        when(mockMoviedbDatasource.getMovieById(1029575)).thenAnswer(
          (_) async {
            final Movie movie = MovieMapper.movieDetailsToEntity(
              MovieDetails.fromJson(
                json.decode(
                    '{"adult": false,"backdrop_path": "/r9oTasGQofvkQY5vlUXglneF64Z.jpg","belongs_to_collection": null,"budget": 0,"genres": [{"id": 28,"name": "Action"},{"id": 35,"name": "Comedy"}],"homepage": "","id": 1029575,"imdb_id": "tt134134","original_language": "en","original_title": "The Family Plan","overview": "Dan Morgan es un hombre con muchas identidades: es un esposo devoto, un padre amoroso y un reconocido vendedor de autos.","popularity": 3089.182,"poster_path": "/7mEX07jWRYrjarW84sBeFghGMfa.jpg","production_companies": [{"id": 5,"logo_path": "/71BqEFAF4V3qjjMPCpLuyJFB9A.png","name": "Columbia Pictures","origin_country": "US"}],"production_countries": [{"iso_3166_1": "US","name": "United States of America"}],"release_date": "2023-12-14","revenue": 0,"runtime": 0,"spoken_languages": [{"english_name": "English","iso_639_1": "en","name": "English"}],"status": "Released","tagline": "","title": "Plan familiar","video": false,"vote_average": 7.398,"vote_count": 637}'),
              ),
            );
            return movie;
          },
        );
        final movie = await datasource.getMovieById(1029575);
        expect(movie, isA<Movie>());
        expect(movie.id, 1029575);
      });
    });
  });
}
