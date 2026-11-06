import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_client_app/config/constants/sizes_config.dart';
import 'package:two_client_app/config/routes/app_route_config.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/features/app/bloc/app_bloc.dart';

class NotificationsIcon extends StatelessWidget {
  final GlobalKey iconKey;

  const NotificationsIcon({super.key, required this.iconKey});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppBloc, AppState, int>(
      selector: (state) {
        return state.unreadNotifiList.length;
      },
      builder: (context, unreadCount) {
        return Stack(
          children: [
            IconButton(
              onPressed: () => context.pushNamed(AppRouteConfig.notification),
              icon: const Icon(
                Iconsax.notification,
                size: SizesConfig.iconsLg,
                color: AppColors.white,
              ),
            ),
            if (unreadCount > 0)
              Positioned(
                right: 5,
                top: 1,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(minHeight: 18),
                  child: Text(
                    unreadCount > 9 ? '+9' : unreadCount.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
