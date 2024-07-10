import 'package:tvs_app/tvs/domain/entities/tv.dart';

abstract class GetOnAirTvsState {}

class GetOnAirTvsInitial extends GetOnAirTvsState {}

class GetOnAirTvsLoading extends GetOnAirTvsState {}

class GetOnAirTvsSuccess extends GetOnAirTvsState {
  final List<Tv> tvs;

  GetOnAirTvsSuccess(this.tvs);
}

class GetOnAirTvsFailure extends GetOnAirTvsState {
  final String message;

  GetOnAirTvsFailure(this.message);
}
