import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';

import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesSlideShow extends StatelessWidget {
  final AsyncValue<List<Movie>> movies;

  const MoviesSlideShow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 210,
      width: double.infinity,
      child: movies.when(
        loading: () => Swiper(
          viewportFraction: 0.8,
          scale: 0.9,
          itemCount: 3,
          pagination: SwiperPagination(
            margin: const EdgeInsets.only(top: 10),
            builder: DotSwiperPaginationBuilder(
              color: colors.secondary,
              activeColor: colors.primary,
            ),
          ),
          itemBuilder: (context, index) {
            return const _LoadingMovie();
          },
        ),
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        data: (movies) => Swiper(
          viewportFraction: 0.8,
          scale: 0.9,
          autoplay: true,
          autoplayDelay: 5000,
          pagination: SwiperPagination(
            margin: const EdgeInsets.only(top: 10),
            builder: DotSwiperPaginationBuilder(
              color: colors.secondary,
              activeColor: colors.primary,
            ),
          ),
          itemCount: movies.length,
          itemBuilder: (context, index) => _Slide(movie: movies[index]),
        ),
      ),
    );
  }
}

class _SlideBody extends StatelessWidget {
  final Widget child;

  const _SlideBody({required this.child});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black45.withOpacity(0.15),
          blurRadius: 5,
          offset: const Offset(0, 10),
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(borderRadius: BorderRadius.circular(20), child: child),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    return _SlideBody(
      child: Image.network(
        movie.backdropPath,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress != null) {
            return const _LoadingMovie();
          }

          return FadeIn(
            duration: const Duration(milliseconds: 200),
            child: child,
          );
        },
      ),
    );
  }
}

class _LoadingMovie extends StatelessWidget {
  const _LoadingMovie();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return _SlideBody(
        child: DecoratedBox(
            decoration: BoxDecoration(color: colors.primary.withOpacity(0.5)),
            child: const Center(child: CircularProgressIndicator())));
  }
}
