import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:store_ads/core/api/dio_client.dart';
import 'package:store_ads/core/classes/paginated_response.dart';
import 'package:store_ads/features/main_feature/ads_urls.dart';
import 'package:store_ads/features/main_feature/data/datasources/remote/ad_remote_data_source.dart';
import 'package:store_ads/features/main_feature/data/models/ad_model.dart';
import 'package:store_ads/features/main_feature/domain/params/ad_param.dart';

@LazySingleton(as: AdRemoteDataSource)
class AdRemoteDataSourceImp implements AdRemoteDataSource {
  final IDioClient dioClient;
  AdRemoteDataSourceImp({required this.dioClient});

  @override
  Future<PaginatedResponse<AdModel>> getAdsWithFilter({
    required AdParam params,
  }) async {
    final response = await dioClient.get(
      AdsUrls.getAdsWithFilter,
      queryParameters: params.toJson(),
    );
    return PaginatedResponse<AdModel>.fromJson(
      json: response['value'],
      fromJsonT: (json) => AdModel.fromJson(json),
      dataNameField: 'items',
    );
  }
}
