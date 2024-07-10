import 'package:dartz/dartz.dart';
import 'package:tvs_app/core/error/failure.dart';
import 'package:tvs_app/core/usecase/base_usecase.dart';
import 'package:tvs_app/tvs/domain/entities/tv_details.dart';
import 'package:tvs_app/tvs/domain/repository/base_tvs_repository.dart';

class GetTvDetailsUseCase extends BaseUseCase<TvDetails, TvDetailsParameters> {
  final BaseTvsRepository basetvsRepository;

  GetTvDetailsUseCase(this.basetvsRepository);

  @override
  Future<Either<Failure, TvDetails>> call(
      TvDetailsParameters parameters) async {
    return await basetvsRepository.getTvDetails(tvId: parameters.tvId);
  }
}

class TvDetailsParameters {
  final int tvId;

  const TvDetailsParameters({required this.tvId});
}
