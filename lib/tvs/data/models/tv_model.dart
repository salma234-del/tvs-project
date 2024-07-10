import 'package:tvs_app/tvs/domain/entities/tv.dart';

class TvModel extends Tv {
  const TvModel({
    required super.id,
    required super.name,
    required super.backdropPath,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
    required super.voteCount,
  });

  factory TvModel.fromJson(Map<String, dynamic> json) => TvModel(
        id: json["id"],
        name: json["name"],
        backdropPath: json["backdrop_path"],
        overview: json["overview"],
        voteAverage: json["vote_average"].toDouble(),
        releaseDate: json["first_air_date"],
        voteCount: json["vote_count"].toInt(),
      );
}
