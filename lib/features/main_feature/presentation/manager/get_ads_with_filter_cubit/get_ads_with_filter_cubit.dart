import 'package:bloc/bloc.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:meta/meta.dart';
import 'package:store_ads/core/abstracts/base_cubit.dart';
import 'package:store_ads/core/classes/paginated_response.dart';
import 'package:store_ads/features/main_feature/domain/entities/ad_entity.dart';
import 'package:store_ads/features/main_feature/domain/params/ad_param.dart';
import 'package:store_ads/features/main_feature/domain/usecases/get_ads_with_filter_use_case.dart';

part 'get_ads_with_filter_state.dart';

class GetAdsWithFilterCubit extends BaseCubit<GetAdsWithFilterState> {
  final GetAdsWithFilterUseCase _useCase;
  GetAdsWithFilterCubit(this._useCase) : super(GetAdsWithFilterInitial());

  PaginatedResponse<AdEntity>? ads;
  AdParam? lastParams;
  PagewiseLoadController pageLoadTrxController = PagewiseLoadController(
    pageFuture: (pageIndex) async {
      return [];
    },
    pageSize: 20,
  );

  Future<void> emitGetAdsWithFilter({
    AdParam? params,
    bool? isLoading = true,
  }) async {
    if (isLoading == true) {
      safeEmit(GetAdsWithFilterLoading());
    }
    if (params != null) {
      lastParams = params;
    }
    final response = await _useCase.call(params ?? lastParams!);
    response.fold(
      (failure) {
        safeEmit(
          GetAdsWithFilterFailure(
            detail: failure.detail,
            errors: failure.errors,
          ),
        );
      },
      (data) {
        ads = data;
        safeEmit(
          GetAdsWithFilterSuccess(
            ads: data,
          ),
        );
      },
    );
  }

  Future<PagewiseLoadController<dynamic>> initPagination({
    required AdParam params,
  }) async {
    pageLoadTrxController = PagewiseLoadController(
      pageFuture: (pageIndex) async {
        int page = pageIndex! + 1;
        params.pageNumber = page;
        await emitGetAdsWithFilter(
          params: params,
        );
        return ads?.data ?? [];
      },
      pageSize: params.pageSize,
    );
    return pageLoadTrxController;
  }

  void refreshAds() {
    pageLoadTrxController.reset();
  }
}
