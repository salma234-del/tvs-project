import 'package:tvs_app/tvs/domain/entities/tv.dart';

abstract class GetTopRatedTvsState {}

final class GetTopRatedTvsInitial extends GetTopRatedTvsState {}

class GetTopRatedTvsLoading extends GetTopRatedTvsState {}
class GetTopRatedTvsLoadingMore extends GetTopRatedTvsState {}

class GetTopRatedTvsSuccess extends GetTopRatedTvsState {
  final List<Tv> tvs;
  final bool hasReachedMax;

  GetTopRatedTvsSuccess({
    required this.tvs,
    required this.hasReachedMax,
  
  });
}

class GetTopRatedTvsFailure extends GetTopRatedTvsState {
  final String message;

  GetTopRatedTvsFailure(this.message);
}
