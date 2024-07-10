import 'package:dartz/dartz.dart';
import 'package:tvs_app/core/error/failure.dart';
import 'package:tvs_app/tvs/domain/entities/tv.dart';
import 'package:tvs_app/tvs/domain/entities/tv_details.dart';

abstract class BaseTvsRepository {
  Future<Either<Failure, List<Tv>>> getOnTheAirTvs({
    int page = 1,
  });

  Future<Either<Failure, List<Tv>>> getPopularTvs({
    int page = 1,
  });

  Future<Either<Failure, List<Tv>>> getTopRatedTvs({
    int page = 1,
  });

  Future<Either<Failure, TvDetails>> getTvDetails({
    required int tvId,
  });
}
