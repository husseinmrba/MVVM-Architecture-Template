import 'package:flutter/material.dart';
import 'package:store_ads/core/colors/app_colors.dart';
import 'package:store_ads/core/styles/styles.dart';

class ImageTextBoxWidget extends StatelessWidget {
  final String imageUrl;
  final String text;
  final Color backgroundColor;
  final double imageWidth;
  final double? width;
  final double? height;

  const ImageTextBoxWidget({
    super.key,
    required this.imageUrl,
    required this.text,
    this.backgroundColor = Colors.grey,
    this.imageWidth = 60,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              right: Radius.circular(12),
            ),
            child: Image.network(
              imageUrl,
              width: imageWidth,
              height: imageWidth,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: Styles.bodyMedium.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
