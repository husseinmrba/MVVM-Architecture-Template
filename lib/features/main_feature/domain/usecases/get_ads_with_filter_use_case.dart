import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_ads/core/abstracts/base_use_case.dart';
import 'package:store_ads/core/classes/paginated_response.dart';
import 'package:store_ads/core/errors/failure.dart';
import 'package:store_ads/features/main_feature/domain/entities/ad_entity.dart';
import 'package:store_ads/features/main_feature/domain/params/ad_param.dart';
import 'package:store_ads/features/main_feature/domain/repo/ad_repo.dart';

@lazySingleton
class GetAdsWithFilterUseCase
    extends BaseUseCase<PaginatedResponse<AdEntity>, AdParam> {
  final AdRepo adRepo;

  GetAdsWithFilterUseCase({required this.adRepo});

  @override
  Future<Either<Failure, PaginatedResponse<AdEntity>>> call(
    AdParam params,
  ) async {
    return await adRepo.getAdsWithFilter(params: params);
  }
}
