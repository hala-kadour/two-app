import 'package:flutter/material.dart';
import 'package:two_client_app/config/constants/padding_config.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/core/widgets/app-bar/custom_app_bar.dart';
import 'package:two_client_app/features/app/data/models/single-models/project_model.dart';
import 'package:two_client_app/features/projects/widgets/update_project_form.dart';

class UpdateProjectPage extends StatefulWidget {
  const UpdateProjectPage({super.key, required this.projectModel});
  final ProjectModel projectModel;

  @override
  State<UpdateProjectPage> createState() => _UpdateProjectPageState();
}

class _UpdateProjectPageState extends State<UpdateProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: TextStrings.updateProject),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              PaddingConfig.h16,
              UpdateProjectForm(project: widget.projectModel),
            ],
          ),
        ),
      ),
    );
  }
}
