import 'package:store_ads/core/classes/paginated_response.dart';
import 'package:store_ads/features/main_feature/data/models/ad_model.dart';
import 'package:store_ads/features/main_feature/domain/params/ad_param.dart';

abstract class AdRemoteDataSource {
  Future<PaginatedResponse<AdModel>> getAdsWithFilter({
    required AdParam params,
  });
}
