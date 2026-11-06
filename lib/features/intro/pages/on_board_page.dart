import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_client_app/config/constants/padding_config.dart';
import 'package:two_client_app/config/paths/assets_path.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/routes/app_route_config.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';
import 'package:two_client_app/core/widgets/buttons/elevated-button/main_gray_button.dart';
import 'package:two_client_app/core/widgets/buttons/elevated-button/main_green_button.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  final PageController _controller = PageController();
  final ValueNotifier<int> _pageNotifier = ValueNotifier<int>(0);

  final List<Map<String, String>> onboardingItems = [
    {
      'image': ImagesPath.onboard1,
      'title': TextStrings.title1,
      'description': TextStrings.supTitle1,
    },
    {
      'image': ImagesPath.onboard2,
      'title': TextStrings.title2,
      'description': TextStrings.supTitle2,
    },
    {
      'image': ImagesPath.onboard3,
      'title': TextStrings.title3,
      'description': TextStrings.supTitle3,
    },
  ];

  void _goToNextPage() {
    final isLastPage = _pageNotifier.value == onboardingItems.length - 1;

    if (isLastPage) {
      context.pushReplacementNamed(AppRouteConfig.login);
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  void _skip() {
    context.pushReplacementNamed(AppRouteConfig.login);
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: _pageNotifier,
        builder: (context, currentPage, _) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: onboardingItems.length,
                    onPageChanged: (index) => _pageNotifier.value = index,
                    itemBuilder: (_, index) {
                      final item = onboardingItems[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(item['image']!, height: 300, width: 350),
                          PaddingConfig.h24,
                          Text(
                            item['title']!,
                            style: AppTextStyle.headerMd(),
                            textAlign: TextAlign.center,
                          ),
                          PaddingConfig.h24,
                          Text(
                            item['description']!,
                            style: AppTextStyle.bodyLg(
                              color: AppColors.fontLightColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                MainGreenButton(
                  text: 'Next',
                  onpressed: () {
                    _goToNextPage();
                  },
                ),
                PaddingConfig.h16,
                MainGrayButton(
                  text: 'Skip',
                  onpressed: () {
                    _skip();
                  },
                ),
                PaddingConfig.h40,
              ],
            ),
          );
        },
      ),
    );
  }
}
