import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 75,
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: Icon(Iconsax.arrow_left, size: 36, color: AppColors.white),
      ),
      title: Text(title, style: AppTextStyle.headerSm(color: AppColors.white)),
      backgroundColor: AppColors.navy1,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}
