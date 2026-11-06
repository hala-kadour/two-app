import 'package:flutter/widgets.dart';
import 'package:two_client_app/config/constants/sizes_config.dart';
import 'package:two_client_app/config/theme/color.dart';

class CustomRounderContainer extends StatelessWidget {
  const CustomRounderContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.margin,
    this.showShadow = false,
    this.showBorder = true,
    this.padding = const EdgeInsets.all(SizesConfig.md),
    this.borderColor = AppColors.gray2,
    this.radius = 20.0,
    this.backgroundColor = AppColors.white,
    this.onTap,
  });

  final Widget? child;
  final double radius;
  final double? width;
  final double? height;
  final bool showBorder;
  final bool showShadow;
  final Color borderColor;
  final EdgeInsets? margin;
  final EdgeInsets padding;
  final Color backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: showBorder
              ? Border.all(color: borderColor, width: 0.5)
              : null,
          boxShadow: [
            if (showShadow)
              BoxShadow(
                color: AppColors.gray1,
                spreadRadius: 5,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
          ],
        ),
        child: child,
      ),
    );
  }
}
