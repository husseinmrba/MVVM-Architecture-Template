import 'package:dartz/dartz.dart';
import 'package:store_ads/core/classes/paginated_response.dart';
import 'package:store_ads/core/errors/failure.dart';
import 'package:store_ads/features/main_feature/domain/entities/ad_entity.dart';
import 'package:store_ads/features/main_feature/domain/params/ad_param.dart';

abstract class AdRepo {
  Future<Either<Failure, PaginatedResponse<AdEntity>>> getAdsWithFilter({
    required AdParam params,
  });
}
