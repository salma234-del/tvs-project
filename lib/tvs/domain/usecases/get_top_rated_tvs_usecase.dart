import 'package:dartz/dartz.dart';
import 'package:tvs_app/core/error/failure.dart';
import 'package:tvs_app/core/usecase/base_usecase.dart';
import 'package:tvs_app/tvs/domain/entities/tv.dart';
import 'package:tvs_app/tvs/domain/repository/base_tvs_repository.dart';

class GetTopRatedTvsUseCase extends BaseUseCase<List<Tv>, GetTopRatedTvsParameters> {
  final BaseTvsRepository basetTvsRepository;

  GetTopRatedTvsUseCase(this.basetTvsRepository);

  @override
  Future<Either<Failure, List<Tv>>> call(GetTopRatedTvsParameters parameters) async {
    return await basetTvsRepository.getTopRatedTvs(
      page: parameters.page,
    );
  }

  
}

class GetTopRatedTvsParameters {
    final int page;

    const GetTopRatedTvsParameters({required this.page});
  }
