import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvs_app/core/usecase/base_usecase.dart';
import 'package:tvs_app/tvs/domain/usecases/get_on_the_air_tvs_usecase.dart';
import 'package:tvs_app/tvs/presentation/controller/get_on_the_air_tvs_cubit/get_on_air_tvs_state.dart';

class GetOnAirTvsCubit extends Cubit<GetOnAirTvsState> {
  GetOnAirTvsCubit(this.getOnTheAirTvsUseCase) : super(GetOnAirTvsInitial());

  final GetOnTheAirTvsUseCase getOnTheAirTvsUseCase;

  Future<void> getOnTheAirTvs() async {
    emit(GetOnAirTvsLoading());
    final result = await getOnTheAirTvsUseCase(const NoParameters());
    result.fold(
      (l) => emit(GetOnAirTvsFailure(l.message)),
      (r) => emit(GetOnAirTvsSuccess(r)),
    );
  }
}
