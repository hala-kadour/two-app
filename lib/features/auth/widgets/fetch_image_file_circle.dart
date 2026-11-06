import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:two_client_app/config/paths/assets_path.dart';
import 'package:two_client_app/config/theme/color.dart';

// ignore: must_be_immutable
class FetchImageFileCircle extends StatelessWidget {
  FetchImageFileCircle({
    super.key,
    required this.imageB64,
    required this.onUpdate,
  });
  String? imageB64;
  final Function(String?) onUpdate;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<File?> selectedImage = ValueNotifier(null);
    Future<void> getImageFile() async {
      final storageStatus = await Permission.storage.request();
      if (storageStatus.isGranted) {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.image,
          allowMultiple: false,
        );

        if (result != null && result.files.isNotEmpty) {
          final bytes = await result.files.first.xFile.readAsBytes();
          selectedImage.value = File(result.files.first.path!);
          imageB64 = base64Encode(bytes);
          onUpdate(imageB64);
        }
      } else {}
    }

    return Stack(
      children: [
        ValueListenableBuilder(
          valueListenable: selectedImage,
          builder: (context, image, child) => Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: (image == null)
                    ? const AssetImage(ImagesPath.profile)
                    : FileImage(image),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.green4,
            ),
            child: IconButton(
              onPressed: () {
                getImageFile();
              },
              icon: const Icon(Icons.edit, color: AppColors.cardColor),
            ),
          ),
        ),
      ],
    );
  }
}
