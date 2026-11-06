import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iconsax/iconsax.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:two_client_app/config/constants/baseuri.dart';
import 'package:two_client_app/config/constants/sizes_config.dart';
import 'package:two_client_app/config/theme/color.dart';

class FetchNetworkImage extends StatefulWidget {
  const FetchNetworkImage({
    super.key,
    required this.imagePath,
    this.shape = BoxShape.circle,
    this.height,
    this.width,
    this.border,
  });
  final String? imagePath;
  final BoxShape shape;
  final double? height;
  final double? width;
  final BoxBorder? border;

  @override
  State<FetchNetworkImage> createState() => _FetchNetworkImageState();
}

class _FetchNetworkImageState extends State<FetchNetworkImage> {
  Uint8List? imageBytes;

  Future<void> fetchImage(String filename) async {
    final response = await http.post(
      Uri.parse('$baseUri/api/get/image?filename=$filename'),
    );

    if (response.statusCode == 200 && mounted) {
      setState(() {
        imageBytes = response.bodyBytes;
      });
    } else {
      log("${response.statusCode}");
      log(response.body);
    }
  }

  @override
  void initState() {
    if (widget.imagePath != null) {
      fetchImage(widget.imagePath!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (widget.imagePath == null)
        ? Container(
            height: widget.height ?? 50,
            width: widget.width ?? 50,
            clipBehavior: Clip.hardEdge,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: AppColors.gray1,
              borderRadius: (widget.shape != BoxShape.circle)
                  ? BorderRadius.circular(SizesConfig.borderRadiusSm)
                  : null,
              border: widget.border,
              shape: widget.shape,
            ),
            child: Icon(Iconsax.frame_1, color: AppColors.white),
          )
        : imageBytes != null
        ? Container(
            height: widget.height ?? 50,
            width: widget.width ?? 50,
            clipBehavior: Clip.hardEdge,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              borderRadius: (widget.shape != BoxShape.circle)
                  ? BorderRadius.circular(SizesConfig.borderRadiusSm)
                  : null,
              shape: widget.shape,
              border: widget.border,
            ),
            child: Image.memory(imageBytes!, fit: BoxFit.cover),
          )
        : Skeletonizer(
            containersColor: Colors.grey[300]!,
            child: Container(
              height: widget.height ?? 50,
              width: widget.width ?? 50,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: (widget.shape != BoxShape.circle)
                    ? BorderRadius.circular(SizesConfig.borderRadiusSm)
                    : null,
                shape: widget.shape,
              ),
            ),
          );
  }
}
