import 'package:flutter/material.dart';
import 'package:two_client_app/config/constants/padding_config.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/text_style.dart';
import 'package:two_client_app/core/widgets/main_text_field.dart';
import 'package:two_client_app/features/auth/widgets/fetch_pdf_file_container.dart';
import 'package:two_client_app/features/projects/widgets/create-project/custom_choise_chip.dart';

class ProjectRequestStep extends StatefulWidget {
  const ProjectRequestStep({
    super.key,
    required this.formKey,
    required this.selectedProjectType,
    required this.selectedDesription,
    required this.selectedKeyRequirements,
    required this.projectDescriptionController,
    required this.requirementController,
    required this.fileB64,
  });

  final GlobalKey<FormState> formKey;

  final ValueNotifier<String?> selectedProjectType;
  final ValueNotifier<String?> selectedDesription;

  /// الآن صارت لائحة لأنه ممكن يختار أكثر من requirement
  final ValueNotifier<List<String>> selectedKeyRequirements;

  final TextEditingController projectDescriptionController;
  final TextEditingController requirementController;

  final ValueNotifier<String?> fileB64;

  @override
  State<ProjectRequestStep> createState() => _ProjectRequestStepState();
}

class _ProjectRequestStepState extends State<ProjectRequestStep> {
  bool _descriptionVisible = false;
  bool _requirementVisible = false;

  final List<String> description = [
    TextStrings.mobileAppForTaskManagement,
    TextStrings.eCommerceWebsite,
    TextStrings.portfolioWebsite,
    TextStrings.onlineBookingSystem,
    TextStrings.learningManagementSystem,
    TextStrings.socialMediaApp,
    TextStrings.restaurantOrderingDeliveryApp,
    TextStrings.fitnessTrackingApplication,
    TextStrings.realEstateListingWebsite,
    TextStrings.bloggingPlatform,
    TextStrings.eventManagementApp,
    TextStrings.customerSupportChatbot,
    TextStrings.inventoryManagementSystem,
    TextStrings.personalFinanceBudgetingApp,
    TextStrings.onlineMarketplacePlatform,
  ];

  final List<String> keyReq = [
    TextStrings.simpleUI,
    TextStrings.multiLanguage,
    TextStrings.adminDashboard,
    TextStrings.userAuthentication,
    TextStrings.securePaymentIntegration,
    TextStrings.pushNotifications,
    TextStrings.darkLightMode,
    TextStrings.fastPerformance,
    TextStrings.scalableArchitecture,
    TextStrings.cloudStorageIntegration,
    TextStrings.dataAnalyticsReports,
    TextStrings.roleBasedAccessControl,
    TextStrings.apiIntegration,
    TextStrings.offlineModeSupport,
    TextStrings.responsiveDesign,
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PaddingConfig.h16,
          Text(TextStrings.projectType, style: AppTextStyle.bodySm()),
          PaddingConfig.h16,

          /// Project Type
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(5, (index) {
              final labels = [
                TextStrings.mobileApp,
                TextStrings.website,
                TextStrings.systemAnalysis,
                TextStrings.softwareTesting,
                TextStrings.maintain,
              ];
              return ValueListenableBuilder(
                valueListenable: widget.selectedProjectType,
                builder: (context, value, child) => CustomChoiceChip(
                  label: labels[index],
                  selected: widget.selectedProjectType.value == labels[index],
                  onSelected: () =>
                      widget.selectedProjectType.value = labels[index],
                ),
              );
            }),
          ),

          /// Project Description
          PaddingConfig.h24,
          Text(TextStrings.projectDescription, style: AppTextStyle.bodySm()),
          PaddingConfig.h16,
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ...description.map((label) {
                return ValueListenableBuilder<String?>(
                  valueListenable: widget.selectedDesription,
                  builder: (context, value, child) => CustomChoiceChip(
                    label: label,
                    selected: widget.selectedDesription.value == label,
                    onSelected: () => widget.selectedDesription.value = label,
                  ),
                );
              }),
              CustomChoiceChip(
                label: TextStrings.addNew,
                selected: false,
                onSelected: () {
                  setState(() {
                    _descriptionVisible = !_descriptionVisible;
                  });
                },
              ),
            ],
          ),
          PaddingConfig.h16,
          Visibility(
            visible: _descriptionVisible,
            child: MainTextField(
              hint: "",
              controller: widget.projectDescriptionController,
              maxLines: 4,
              validator: (input) {
                if (input == null || input.trim().isEmpty) {
                  return TextStrings.fieldValidation;
                } else {
                  return null;
                }
              },
              onSubmitted: (input) {
                if (input.trim().isNotEmpty) {
                  widget.selectedDesription.value = input.trim();
                  widget.projectDescriptionController.clear();
                  setState(() => _descriptionVisible = false);
                }
              },
            ),
          ),

          /// Key Requirements
          PaddingConfig.h24,
          Text(TextStrings.keyRequirements, style: AppTextStyle.bodySm()),
          PaddingConfig.h16,
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ...keyReq.map((label) {
                return ValueListenableBuilder<List<String>>(
                  valueListenable: widget.selectedKeyRequirements,
                  builder: (context, value, child) {
                    final isSelected = value.contains(label);
                    return CustomChoiceChip(
                      label: label,
                      selected: isSelected,
                      onSelected: () {
                        if (isSelected) {
                          widget.selectedKeyRequirements.value = List.from(
                            value,
                          )..remove(label);
                        } else {
                          widget.selectedKeyRequirements.value = List.from(
                            value,
                          )..add(label);
                        }
                      },
                    );
                  },
                );
              }),
              CustomChoiceChip(
                label: TextStrings.addNew,
                selected: false,
                onSelected: () {
                  setState(() {
                    _requirementVisible = !_requirementVisible;
                  });
                },
              ),
            ],
          ),
          PaddingConfig.h16,
          Visibility(
            visible: _requirementVisible,
            child: MainTextField(
              hint: TextStrings.addRequirement,
              controller: widget.requirementController,
              maxLines: 2,
              validator: (input) {
                if (input == null || input.trim().isEmpty) {
                  return TextStrings.fieldValidation;
                } else {
                  return null;
                }
              },
              onSubmitted: (input) {
                if (input.trim().isNotEmpty) {
                  widget.selectedKeyRequirements.value = List.from(
                    widget.selectedKeyRequirements.value,
                  )..add(input.trim());
                  widget.requirementController.clear();
                  setState(() => _requirementVisible = false);
                }
              },
            ),
          ),

          /// Upload document
          PaddingConfig.h24,
          Text(
            TextStrings.didYouPrepareDocuments,
            style: AppTextStyle.bodySm(),
          ),
          PaddingConfig.h16,
          FetchPdfFileContainer(
            fileB64: widget.fileB64.value,
            onUpdate: (newFile) {
              widget.fileB64.value = newFile;
            },
          ),
          PaddingConfig.h24,
        ],
      ),
    );
  }
}
