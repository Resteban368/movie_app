// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:movie_app/presentation/widgets/shared/custom_appbar.dart';

import '../../widgets/movies/MovieList.dart';
import '../../widgets/movies/textInfoMovie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Scaffold(
      // backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: Column(children: [
          CustomAppbar(
            title: 'Movie App',
            showLeading: true,
          ),
          const TextInfoMovie(
            title: 'En cine',
          ),
          const MoviesListWidget(
            item: 1,
          ),
          const TextInfoMovie(
            title: 'Mas votadas',
          ),
          const MoviesListWidget(
            item: 2,
          ),
          const TextInfoMovie(
            title: 'Proximamente',
          ),
          const MoviesListWidget(
            item: 3,
          ),
           const SizedBox(
            height:30,
          ),
          // MoviesPopularListWidget(),
        ]),
      ),
    ));
  }
}
