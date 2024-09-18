import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_architecture_template/core/routes/app_routes.dart';
import 'package:mvvm_architecture_template/core/translations/my_translations_config.dart';
import 'package:mvvm_architecture_template/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MVVM Architecture Template',
      scrollBehavior: _MyCustomScrollBehavior(),
      enableLog: true,
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale ?? const Locale('en', 'US'),
      fallbackLocale: Get.deviceLocale ?? const Locale('en', 'US'),
      translations: MyTranslationsConfig(),
      defaultTransition:
          (kIsWeb) ? Transition.noTransition : Transition.cupertino,
      routingCallback: (value) {},
      theme: context.lightTheme,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: AppRoutes.splashRoute,
    );
  }
}

class _MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
