import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:two_client_app/config/constants/padding_config.dart';
import 'package:two_client_app/config/constants/sizes_config.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';

// ignore: must_be_immutable
class FetchPdfFileContainer extends StatelessWidget {
  FetchPdfFileContainer({
    super.key,
    required this.fileB64,
    required this.onUpdate,
  });
  String? fileB64;
  final Function(String?) onUpdate;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String?> selectedFile = ValueNotifier(null);

    Future<void> getFile() async {
      final storageStatus = await Permission.storage.request();
      if (storageStatus.isGranted) {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['pdf'],
          allowMultiple: false,
        );
        if (result != null && result.files.isNotEmpty) {
          final bytes = await result.files.first.xFile.readAsBytes();
          selectedFile.value = result.files.first.name;
          fileB64 = base64Encode(bytes);
          onUpdate(fileB64);
        }
      } else {}
    }

    return InkWell(
      onTap: getFile,
      child: Container(
        height: 60,
        width: double.infinity,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: AppColors.fieldfield,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.fieldfield),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.article_rounded,
              color: AppColors.iconColor,
              size: SizesConfig.iconsSm,
            ),
            PaddingConfig.w8,
            ValueListenableBuilder(
              valueListenable: selectedFile,
              builder: (context, file, child) => SizedBox(
                width: 150,
                child: Text(
                  (file == null) ? TextStrings.file : file,
                  style: AppTextStyle.bodySm(color: AppColors.fontDarkColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
