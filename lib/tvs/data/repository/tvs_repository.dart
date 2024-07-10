import 'package:dartz/dartz.dart';
import 'package:tvs_app/core/error/exceptions.dart';
import 'package:tvs_app/core/error/failure.dart';
import 'package:tvs_app/tvs/data/datasource/tvs_remote_data_source.dart';
import 'package:tvs_app/tvs/domain/entities/tv.dart';
import 'package:tvs_app/tvs/domain/entities/tv_details.dart';
import 'package:tvs_app/tvs/domain/repository/base_tvs_repository.dart';

class TvsRepository extends BaseTvsRepository {
  final BaseTvsRemoteDataSource baseTvsRemoteDataSource;

  TvsRepository(this.baseTvsRemoteDataSource);

  @override
  Future<Either<Failure, List<Tv>>> getOnTheAirTvs(
      {int page = 1}
  ) async {
    final result = await baseTvsRemoteDataSource.getOnTheAirTvs();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getPopularTvs({
    int page = 1,
  }) async {
    final result = await baseTvsRemoteDataSource.getPopularTvs(
      page: page,
    );
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTopRatedTvs({
    int page = 1,
  }) async {
    final result = await baseTvsRemoteDataSource.getTopRatedTvs(
      page: page,
    
    );
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, TvDetails>> getTvDetails({required int tvId}) async {
    final result = await baseTvsRemoteDataSource.getTvDetails(tvId: tvId);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
