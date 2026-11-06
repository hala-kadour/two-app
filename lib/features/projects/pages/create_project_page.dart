import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_client_app/config/constants/padding_config.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/core/functions/bloc_state_handling/app_bloc_state_handling.dart';
import 'package:two_client_app/core/widgets/app-bar/custom_app_bar.dart';
import 'package:two_client_app/features/app/bloc/app_bloc.dart';
import 'package:two_client_app/features/projects/widgets/create-project/create_project_body.dart';

class CreateProjectPage extends StatelessWidget {
  const CreateProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: TextStrings.createProject),
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingConfig.pagePadding,
          child: Column(
            children: [
              // Body
              BlocListener<AppBloc, AppState>(
                listenWhen: (previous, current) =>
                    previous.createProjectStatus != current.createProjectStatus,
                listener: (context, state) {
                  AppBlocStateHandling().createProject(state, context);
                },
                child: CreateProjectBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
