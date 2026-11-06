import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_client_app/config/paths/assets_path.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.onTap,
    required this.pageIndex,
  });
  final void Function(int)? onTap;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedItemColor: AppColors.mainColor,
        selectedLabelStyle: AppTextStyle.bodySm(color: AppColors.mainColor),
        unselectedLabelStyle: AppTextStyle.bodySm(color: AppColors.rock1),
        currentIndex: pageIndex,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              IconsPath.home,
              width: 30,
              color: pageIndex == 0 ? AppColors.mainColor : AppColors.rock1,
            ),
            label: TextStrings.home,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              IconsPath.project,
              width: 30,
              color: pageIndex == 1 ? AppColors.mainColor : AppColors.rock1,
            ),
            label: TextStrings.project,
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.buttonColor,
              ),
              child: SvgPicture.asset(
                IconsPath.add,
                width: 30,
                color: AppColors.white,
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              IconsPath.contract,
              width: 30,
              color: pageIndex == 3 ? AppColors.mainColor : AppColors.rock1,
            ),
            label: TextStrings.contract,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              IconsPath.profile,
              width: 25,
              color: pageIndex == 4 ? AppColors.mainColor : AppColors.rock1,
            ),
            label: TextStrings.profile,
          ),
        ],
      ),
    );
  }
}
