import 'package:store_ads/core/configs/app_configuration.dart';
import 'package:store_ads/core/routes/app_routes.dart';
import 'package:store_ads/core/widgets/custom_progress_indicator.dart';
import 'package:store_ads/generated/assets.dart';
import 'package:store_ads/injectable_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_ads/features/splash_feature/presentation/views/widgets/sliding_text.dart';
import 'package:get/get.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  // late AnimationController animationController;
  // late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    // initSlidingAnimation();
    Future.delayed(const Duration(seconds: 4), () {
      Get.offAllNamed(AppRoutes.mainRoute);
      if (getIt<AppConfiguration>().isAuthorized) {
        // Get.offAllNamed(AppRoutes.mainRoute);
      } else {
        // Get.offAllNamed(AppRoutes.loginRoute);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          Assets.imagesLogo,
          width: 120,
          height: 120,
        ),
        const SizedBox(
          height: 4,
        ),
        // SlidingText(
        //   slidingAnimation: slidingAnimation,
        // ),
        const CustomProgressIndicator(
          size: 25,
        ),
      ],
    );
  }

  // void initSlidingAnimation() {
  //   animationController = AnimationController(
  //     vsync: this,
  //     duration: const Duration(seconds: 2),
  //   );
  //
  //   slidingAnimation =
  //       Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
  //           .animate(animationController);
  //   animationController.forward();
  // }

  @override
  void dispose() {
    // animationController.dispose();
    super.dispose();
  }
}
