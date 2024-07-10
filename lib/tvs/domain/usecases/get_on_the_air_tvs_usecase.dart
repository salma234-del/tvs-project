import 'package:dartz/dartz.dart';
import 'package:tvs_app/core/error/failure.dart';
import 'package:tvs_app/core/usecase/base_usecase.dart';
import 'package:tvs_app/tvs/domain/entities/tv.dart';
import 'package:tvs_app/tvs/domain/repository/base_tvs_repository.dart';

class GetOnTheAirTvsUseCase extends BaseUseCase<List<Tv>, NoParameters> {
  final BaseTvsRepository baseTvsRepository;

  GetOnTheAirTvsUseCase(this.baseTvsRepository);

  @override
  Future<Either<Failure, List<Tv>>> call(NoParameters parameters) async {
    return await baseTvsRepository.getOnTheAirTvs();
  }
}
