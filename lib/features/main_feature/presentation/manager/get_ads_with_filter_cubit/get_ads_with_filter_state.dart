part of 'get_ads_with_filter_cubit.dart';

@immutable
sealed class GetAdsWithFilterState {}

final class GetAdsWithFilterInitial extends GetAdsWithFilterState {}

final class GetAdsWithFilterLoading extends GetAdsWithFilterState {}

final class GetAdsWithFilterSuccess extends GetAdsWithFilterState {
  final PaginatedResponse<AdEntity> ads;

  GetAdsWithFilterSuccess({required this.ads});
}

final class GetAdsWithFilterFailure extends GetAdsWithFilterState {
  final String detail;
  final List<String>? errors;

  GetAdsWithFilterFailure({
    required this.detail,
    this.errors,
  });
}
