import 'package:dartz/dartz.dart';
import 'package:tvs_app/core/error/failure.dart';
import 'package:tvs_app/core/usecase/base_usecase.dart';
import 'package:tvs_app/tvs/domain/entities/tv.dart';
import 'package:tvs_app/tvs/domain/repository/base_tvs_repository.dart';

class GetPopularTvsUseCase extends BaseUseCase<List<Tv>, PopularTvsParameters> {
  final BaseTvsRepository basetTvsRepository;

  GetPopularTvsUseCase(this.basetTvsRepository);

  @override
  Future<Either<Failure, List<Tv>>> call(
      PopularTvsParameters parameters) async {
    return await basetTvsRepository.getPopularTvs(
      page: parameters.page,
    );
  }
}

class PopularTvsParameters {
  final int page;

  const PopularTvsParameters({required this.page});
}
