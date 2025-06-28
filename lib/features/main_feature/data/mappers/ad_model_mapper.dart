import 'package:store_ads/features/main_feature/data/models/ad_model.dart';
import 'package:store_ads/features/main_feature/domain/entities/ad_entity.dart';

extension AdModelMapper on AdModel {
  AdEntity toEntity() {
    return AdEntity(
      id: id ?? '',
      iconId: iconId ?? '',
      videoId: videoId ?? '',
      cityCode: cityCode ?? '',
      title: title ?? '',
      description: description ?? '',
      price: price ?? 0.0,
      advertisementDuration: advertisementDuration ?? '',
      contentInfo: contentInfo ?? '',
      isActive: isActive ?? false,
      created: created ?? '',
    );
  }
}
