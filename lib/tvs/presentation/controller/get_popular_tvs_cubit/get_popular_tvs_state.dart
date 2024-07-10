import 'package:tvs_app/tvs/domain/entities/tv.dart';

abstract class GetPopularTvsState {}

class GetPopularTvsInitial extends GetPopularTvsState {}

class GetPopularTvsLoading extends GetPopularTvsState {}

class GetPopularTvsLoadingMore extends GetPopularTvsState {}

class GetPopularTvsLoadingMoreError extends GetPopularTvsState {
  final String message;

  GetPopularTvsLoadingMoreError(this.message);
}

class GetPopularTvsLoadingMoreSuccess extends GetPopularTvsState {
  final List<Tv> tvs;
  final bool hasReachedMax;

  GetPopularTvsLoadingMoreSuccess({
    required this.tvs,
    required this.hasReachedMax,
  });
}

class GetPopularTvsSuccess extends GetPopularTvsState {
  final List<Tv> tvs;
  final bool hasReachedMax;

  GetPopularTvsSuccess({
    required this.tvs,
    required this.hasReachedMax,
  });
}

class GetPopularTvsFailure extends GetPopularTvsState {
  final String message;

  GetPopularTvsFailure(this.message);
}
