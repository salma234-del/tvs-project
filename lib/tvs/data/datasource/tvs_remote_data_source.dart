import 'package:tvs_app/core/error/exceptions.dart';
import 'package:tvs_app/core/network/api_constants.dart';
import 'package:tvs_app/core/network/error_message_model.dart';
import 'package:tvs_app/core/services/api_service.dart';
import 'package:tvs_app/tvs/data/models/tv_details_model.dart';
import 'package:tvs_app/tvs/data/models/tv_model.dart';

abstract class BaseTvsRemoteDataSource {
  Future<List<TvModel>> getOnTheAirTvs();
  Future<List<TvModel>> getPopularTvs({
    int page = 1,
  });
  Future<List<TvModel>> getTopRatedTvs({
    int page = 1,
  });
  Future<TvDetailsModel> getTvDetails({required int tvId});
}

class TvsRemoteDataSource extends BaseTvsRemoteDataSource {
  ApiService apiService;
  TvsRemoteDataSource(this.apiService);

  @override
  Future<List<TvModel>> getOnTheAirTvs() async {
    final response =
        await apiService.get(endPoint: ApiConstants.onTheAirTvsPath);
    if (response.statusCode == 200) {
      final List<TvModel> tvs = [];
      for (var tv in response.data['results']) {
        tvs.add(TvModel.fromJson(tv));
      }

      return tvs;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<TvModel>> getPopularTvs({
    int page = 1,
  }) async {
    final response = await apiService.get(
        endPoint: '${ApiConstants.popularTvsPath}&page=$page');
    if (response.statusCode == 200) {
      final List<TvModel> tvs = [];
      for (var tv in response.data['results']) {
        tvs.add(TvModel.fromJson(tv));
      }

      return tvs;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<TvModel>> getTopRatedTvs({
    int page = 1,
  }) async {
    final response = await apiService.get(
        endPoint: '${ApiConstants.topRatedTvsPath}&page=$page');

    if (response.statusCode == 200) {
      final List<TvModel> tvs = [];
      for (var tv in response.data['results']) {
        tvs.add(TvModel.fromJson(tv));
      }
      return tvs;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<TvDetailsModel> getTvDetails({required int tvId}) async {
    final response =
        await apiService.get(endPoint: ApiConstants.tvDetailsPath(tvId));
    if (response.statusCode == 200) {
      return TvDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
