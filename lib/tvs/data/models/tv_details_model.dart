import 'package:tvs_app/tvs/data/models/genres_model.dart';
import 'package:tvs_app/tvs/domain/entities/tv_details.dart';

class TvDetailsModel extends TvDetails {
  const TvDetailsModel({
    required super.backdropPath,
    required super.genres,
    required super.id,
    required super.overview,
    required super.name,
    required super.releaseDate,
    required super.voteAverage,
  });

  factory TvDetailsModel.fromJson(Map<String, dynamic> json) => TvDetailsModel(
        backdropPath: json["backdrop_path"],
        genres: List<GenresModel>.from(
            json["genres"].map((x) => GenresModel.fromJson(x))),
        id: json["id"],
        overview: json["overview"],
        name: json["name"],
        releaseDate: json["first_air_date"],
        voteAverage: json["vote_average"].toDouble(),
      );
}
