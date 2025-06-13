import 'package:flutter/material.dart';
import 'package:store_ads/core/colors/app_colors.dart';
import 'package:store_ads/core/styles/styles.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: Text(
              'Welcome to Al-Fatih Cargo',
              textAlign: TextAlign.center,
              style: Styles.titleMedium.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          );
        });
  }
}
