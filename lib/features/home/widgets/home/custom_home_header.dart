import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_client_app/core/functions/bloc_state_handling/app_bloc_state_handling.dart';
import 'package:two_client_app/features/app/bloc/app_bloc.dart';
import 'package:two_client_app/features/home/widgets/home/notification_icon.dart';

class CustomHomeHeader extends StatelessWidget {
  const CustomHomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey iconKey = GlobalKey();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<AppBloc, AppState>(
          buildWhen: (previous, current) =>
              previous.userHeaderStatus != current.userHeaderStatus,
          builder: (context, state) =>
              AppBlocStateHandling().getUserHeader(state, context),
        ),
        NotificationsIcon(iconKey: iconKey),
      ],
    );
  }
}
