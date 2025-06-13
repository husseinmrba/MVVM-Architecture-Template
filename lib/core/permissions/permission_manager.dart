import 'package:injectable/injectable.dart';
import 'package:store_ads/core/mixins/user_permisions/user_permisions.dart';
import 'package:store_ads/core/permissions/enum/features_enum.dart';
import 'package:store_ads/core/permissions/enum/permission_actions_enum.dart';

@lazySingleton
class PermissionManager with UserPermissionsMixin {
  bool grantAccessBasedOnFeatureControl(
    FeatureEnum feature,
    PermissionActionsEnum permissionAction,
  ) {
    if (isAdmin) {
      return true;
    }
    // if (queueFeatures.contains(feature)) {
    //   return ii<QueueFeatureControl>()
    //       .canWeAccessThisFeature(feature, permissionAction);
    // }
    return false;

    //for test
    // return true;
  }
}
