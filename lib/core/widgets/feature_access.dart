import 'package:store_ads/core/permissions/enum/features_enum.dart';
import 'package:store_ads/core/permissions/enum/permission_actions_enum.dart';
import 'package:store_ads/core/permissions/permission_manager.dart';
import 'package:store_ads/injectable_config.dart';
import 'package:flutter/material.dart';

class FeatureAccess extends StatelessWidget {
  final Widget child;
  final FeatureEnum feature;
  final PermissionActionsEnum permissionAction;

  const FeatureAccess({
    super.key,
    required this.permissionAction,
    required this.child,
    required this.feature,
  });

  @override
  Widget build(BuildContext context) {
    var grantAccess = getIt<PermissionManager>()
        .grantAccessBasedOnFeatureControl(feature, permissionAction);
    return Visibility(visible: grantAccess, child: child);
  }
}
