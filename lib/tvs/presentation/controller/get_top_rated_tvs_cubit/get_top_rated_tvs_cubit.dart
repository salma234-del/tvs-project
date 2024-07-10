import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvs_app/tvs/domain/entities/tv.dart';
import 'package:tvs_app/tvs/domain/usecases/get_top_rated_tvs_usecase.dart';
import 'package:tvs_app/tvs/presentation/controller/get_top_rated_tvs_cubit/get_top_rated_tvs_state.dart';

class GetTopRatedTvsCubit extends Cubit<GetTopRatedTvsState> {
  GetTopRatedTvsCubit(this.getTopRatedTvsUseCase)
      : super(GetTopRatedTvsInitial());

  GetTopRatedTvsUseCase getTopRatedTvsUseCase;

  bool hasReachedMax = false;
  List<Tv> tvs = [];
  int currentPage = 1;

  Future<void> getTopRatedTvs({
    int page = 1,
  }) async {
    if (page == 1) {
      tvs.clear();

      currentPage = 1;
      emit(GetTopRatedTvsLoading());
    } else {
      emit(GetTopRatedTvsLoadingMore());
    }
    final result = await getTopRatedTvsUseCase(
      GetTopRatedTvsParameters(page: page),
    );
    result.fold((l) => emit(GetTopRatedTvsFailure(l.message)), (r) {
      if (r.isEmpty) {
        hasReachedMax = true;
      }
      tvs.addAll(r);

      emit(
        GetTopRatedTvsSuccess(
          tvs: tvs,
          hasReachedMax: hasReachedMax,
        ),
      );
      currentPage++;
    });
  }
}
