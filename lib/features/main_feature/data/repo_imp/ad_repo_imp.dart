import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_ads/core/classes/paginated_response.dart';
import 'package:store_ads/core/errors/error_handler.dart';
import 'package:store_ads/core/errors/failure.dart';
import 'package:store_ads/core/extensions/paginated_response_extension.dart';
import 'package:store_ads/features/main_feature/data/datasources/remote/ad_remote_data_source.dart';
import 'package:store_ads/features/main_feature/data/mappers/ad_model_mapper.dart';
import 'package:store_ads/features/main_feature/domain/entities/ad_entity.dart';
import 'package:store_ads/features/main_feature/domain/params/ad_param.dart';
import 'package:store_ads/features/main_feature/domain/repo/ad_repo.dart';

@LazySingleton(as: AdRepo)
class AdRepoImp implements AdRepo {
  final AdRemoteDataSource remote;

  AdRepoImp({
    required this.remote,
  });

  @override
  Future<Either<Failure, PaginatedResponse<AdEntity>>> getAdsWithFilter({
    required AdParam params,
  }) async {
    try {
      final remoteResponse = await remote.getAdsWithFilter(params: params);
      var remoteEntity = remoteResponse.mapper<AdEntity>(
        (item) => item.toEntity(),
      );
      return Right(remoteEntity);
    } on ServerException catch (e) {
      return Left(
        Failure(
          detail: e.errorModel.detail,
          errors: e.errorModel.errors,
        ),
      );
    }
  }
}
