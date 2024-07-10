import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvs_app/tvs/domain/entities/tv.dart';
import 'package:tvs_app/tvs/domain/usecases/get_popular_tvs_usecase.dart';
import 'package:tvs_app/tvs/presentation/controller/get_popular_tvs_cubit/get_popular_tvs_state.dart';

class GetPopularTvsCubit extends Cubit<GetPopularTvsState> {
  GetPopularTvsCubit(this.getPopularTvsUseCase) : super(GetPopularTvsInitial());

  GetPopularTvsUseCase getPopularTvsUseCase;

  bool hasReachedMax = false;
  List<Tv> tvs = [];
  int currentPage = 1;

  Future<void> getPopularTvs({
    int page = 1,
  }) async {
    if (page == 1) {
      tvs.clear();

      currentPage = 1;
      emit(GetPopularTvsLoading());
    } else {
      emit(GetPopularTvsLoadingMore());
    }
    final result = await getPopularTvsUseCase(
      PopularTvsParameters(page: page),
    );
    result.fold(
      (l) => emit(GetPopularTvsFailure(l.message)),
      (r) {
        if (r.isEmpty) {
          hasReachedMax = true;
        }
        tvs.addAll(r);

        emit(
          GetPopularTvsSuccess(
            tvs: tvs,
            hasReachedMax: hasReachedMax,
          ),
        );
        currentPage++;
      },
    );
  }
}
