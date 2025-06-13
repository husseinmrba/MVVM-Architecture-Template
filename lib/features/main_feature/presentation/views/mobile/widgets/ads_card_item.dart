import 'package:flutter/material.dart';

class AdsCardItem extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String price;
  final double imageHeight;

  const AdsCardItem({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.price,
    this.imageHeight = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            imageUrl,
            width: double.infinity,
            height: imageHeight,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          productName,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          price,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
