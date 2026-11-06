// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:two_client_app/config/paths/assets_path.dart';
import 'package:two_client_app/config/routes/app_route_config.dart';
import 'package:two_client_app/core/services/shared_preferences_services.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      if (await SharedPreferencesServices.checkIfAuthraized()) {
        context.pushReplacementNamed(AppRouteConfig.home);
      } else {
        context.pushReplacementNamed(AppRouteConfig.onboard);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: SvgPicture.asset(ImagesPath.splash)));
  }
}
