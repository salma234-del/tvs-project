import 'package:tvs_app/tvs/domain/entities/tv_details.dart';

abstract class GetTvDetailsState {}

final class GetTvDetailsInitial extends GetTvDetailsState {}

class GetTvDetailsLoading extends GetTvDetailsState {}

class GetTvDetailsSuccess extends GetTvDetailsState {
  final TvDetails tvDetails;

  GetTvDetailsSuccess(this.tvDetails);
}

class GetTvDetailsFailure extends GetTvDetailsState {
  final String message;

  GetTvDetailsFailure(this.message);
}
