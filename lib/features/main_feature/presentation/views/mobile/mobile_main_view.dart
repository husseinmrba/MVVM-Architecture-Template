import 'package:flutter/material.dart';
import 'package:store_ads/core/colors/app_colors.dart';
import 'package:store_ads/core/widgets/custom_bottom_nav_bar.dart';
import 'package:store_ads/features/main_feature/presentation/views/mobile/widgets/main_body_mobile_view.dart';

class MobileMainView extends StatefulWidget {
  const MobileMainView({super.key});

  @override
  State<MobileMainView> createState() => _MobileMainViewState();
}

class _MobileMainViewState extends State<MobileMainView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: MainBodyMobileView(),
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: currentIndex,
          onTap: (index) {
            // Handle bottom navigation tap
            // You can use Get.to() or Navigator.push() to navigate to different views
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
