import 'package:flutter/material.dart';

class CustomImageCircle extends StatelessWidget {
  final String imagePath;
  const CustomImageCircle({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(imagePath))),
    );
  }
}
