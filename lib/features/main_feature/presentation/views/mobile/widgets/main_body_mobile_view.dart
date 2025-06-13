import 'package:flutter/material.dart';
import 'package:store_ads/core/colors/app_colors.dart';
import 'package:store_ads/core/extensions/build_context_extension.dart';
import 'package:store_ads/core/styles/styles.dart';
import 'package:store_ads/core/widgets/banner_carousel.dart';
import 'package:store_ads/core/widgets/custom_dropdown_widget.dart';
import 'package:store_ads/features/main_feature/presentation/views/mobile/widgets/ads_card_item.dart';
import 'package:store_ads/features/main_feature/presentation/views/mobile/widgets/image_text_box_widget.dart';

class MainBodyMobileView extends StatelessWidget {
  const MainBodyMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BannerCarousel(
          height: 150,
          maxImageWidth: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          items: [
            BannerItem(
              url:
                  'https://i.pinimg.com/736x/7d/d5/f3/7dd5f3e530faaab27f9e0f47031cb364.jpg',
            ),
            BannerItem(
              url:
                  'https://download.blender.org/durian/trailer/sintel_trailer-480p.mp4',
              thumbnailUrl:
                  'https://peach.blender.org/wp-content/uploads/title_anouncement.jpg',
            ),
            BannerItem(
              url:
                  'https://i.pinimg.com/736x/7d/d5/f3/7dd5f3e530faaab27f9e0f47031cb364.jpg',
            ),
            BannerItem(
              url:
                  'https://download.blender.org/durian/trailer/sintel_trailer-480p.mp4',
              thumbnailUrl:
                  'https://peach.blender.org/wp-content/uploads/title_anouncement.jpg',
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CustomDropdown<String>(
                items: [
                  'فئة 1',
                  'فئة 2',
                  'فئة 3',
                ],
                itemLabel: (item) => item,
                onChanged: (value) {
                  // Handle category selection
                },
                icon: Icons.category,
                color: AppColors.primaryColor,
                height: 25,
                hint: 'حدد الفئة',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: CustomDropdown<String>(
                items: [
                  'فئة 1',
                  'فئة 2',
                  'فئة 3',
                ],
                itemLabel: (item) => item,
                onChanged: (value) {
                  // Handle category selection
                },
                icon: Icons.category,
                color: AppColors.primaryColor,
                height: 25,
                hint: 'حدد الفئة',
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 50,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                return const ImageTextBoxWidget(
                  imageUrl:
                      'https://i.pinimg.com/736x/30/aa/60/30aa60b277e0c0c80813656c8457400e.jpg',
                  text: 'هذا نص تجريبي',
                  backgroundColor: AppColors.secondaryColor,
                  height: 50,
                  imageWidth: 50,
                );
              }),
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              // mainAxisSpacing: 8,
              // crossAxisSpacing: 8,
              childAspectRatio: 1.45,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return AdsCardItem(
                imageUrl:
                    'https://i.pinimg.com/736x/e0/84/2d/e0842dfc40bf00d4ac92a6b68e0281ee.jpg',
                productName: 'منتج ${index + 1}',
                price: '\$${(index + 1) * 10}',
              );
            },
          ),
        ),
      ],
    );
  }
}
