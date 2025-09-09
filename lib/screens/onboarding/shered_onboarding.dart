import 'package:expenz/constent/colors.dart';
import 'package:expenz/constent/constent.dart';
import 'package:flutter/material.dart';

class SheredOnboarding extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  const SheredOnboarding({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefalutPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageUrl, width: 300, fit: BoxFit.cover),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: kGrey,
            ),
          ),
        ],
      ),
    );
  }
}
