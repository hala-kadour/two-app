import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_client_app/config/constants/padding_config.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/core/functions/bloc_state_handling/app_bloc_state_handling.dart';
import 'package:two_client_app/core/widgets/app-bar/custom_app_bar.dart';
import 'package:two_client_app/features/app/bloc/app_bloc.dart';

class ProjectMeetingPage extends StatefulWidget {
  const ProjectMeetingPage({super.key, required this.projectId});
  final int projectId;

  @override
  State<ProjectMeetingPage> createState() => _ProjectMeetingPageState();
}

class _ProjectMeetingPageState extends State<ProjectMeetingPage> {
  @override
  void didChangeDependencies() {
    context.read<AppBloc>().add(
      ShowProjectMeetingsListEvent(projectId: widget.projectId),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardColor,
      appBar: CustomAppBar(title: TextStrings.projectMeetings),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PaddingConfig.h16,
            Expanded(
              child: BlocBuilder<AppBloc, AppState>(
                buildWhen: (previous, current) =>
                    previous.projectMeetingListStatus !=
                    current.projectMeetingListStatus,
                builder: (context, state) =>
                    AppBlocStateHandling().showProjectMeetingList(state),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
