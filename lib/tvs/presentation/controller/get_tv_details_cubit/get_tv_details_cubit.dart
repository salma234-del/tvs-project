import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvs_app/tvs/domain/usecases/get_tv_details_usecase.dart';
import 'package:tvs_app/tvs/presentation/controller/get_tv_details_cubit/get_tv_details_state.dart';

class GetTvDetailsCubit extends Cubit<GetTvDetailsState> {
  GetTvDetailsCubit(this.getTvDetailsUseCase) : super(GetTvDetailsInitial());

  GetTvDetailsUseCase getTvDetailsUseCase;

  Future<void> getTvDetails(int tvId) async {
    emit(GetTvDetailsLoading());
    final result = await getTvDetailsUseCase(TvDetailsParameters(tvId: tvId));
    result.fold(
      (failure) => emit(GetTvDetailsFailure(failure.message)),
      (tvDetails) => emit(GetTvDetailsSuccess(tvDetails)),
    );
  }
}
