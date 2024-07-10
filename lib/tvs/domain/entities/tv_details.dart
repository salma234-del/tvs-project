import 'package:tvs_app/tvs/domain/entities/genres.dart';

class TvDetails {
  final String backdropPath;
  final List<Genres> genres;
  final int id;
  final String overview;
  final String name;
  final String releaseDate;
  final double voteAverage;

  const TvDetails({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.overview,
    required this.name,
    required this.releaseDate,
    required this.voteAverage,
  });
}
