// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:two_client_app/config/constants/padding_config.dart';
import 'package:two_client_app/config/paths/assets_path.dart';
import 'package:two_client_app/config/routes/app_route_config.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';
import 'package:two_client_app/core/network/enums.dart';
import 'package:two_client_app/core/services/shared_preferences_services.dart';
import 'package:two_client_app/core/widgets/dialogs/error_dialog.dart';
import 'package:two_client_app/core/widgets/dialogs/loading_dialog.dart';
import 'package:two_client_app/core/widgets/dialogs/success_dialog.dart';
import 'package:two_client_app/core/widgets/images/fetch_network_image.dart';
import 'package:two_client_app/core/widgets/status-boxs/empty_status_animation.dart';
import 'package:two_client_app/core/widgets/status-boxs/error_status_box.dart';
import 'package:two_client_app/features/app/bloc/app_bloc.dart';
import 'package:two_client_app/features/app/data/models/single-models/contract_model.dart';
import 'package:two_client_app/features/app/data/models/single-models/meeting_model.dart';
import 'package:two_client_app/features/app/data/models/single-models/message_model.dart';
import 'package:two_client_app/features/app/data/models/single-models/notification_model.dart';
import 'package:two_client_app/features/app/data/models/single-models/project.dart';
import 'package:two_client_app/features/app/data/models/single-models/project_model.dart';
import 'package:two_client_app/features/contract/widgets/custom_contract_list_tile.dart';
import 'package:two_client_app/features/home/widgets/notification_card.dart';
import 'package:two_client_app/features/projects/widgets/custom_project_card.dart';
import 'package:two_client_app/features/projects/widgets/meeting_card.dart';
import 'package:two_client_app/features/projects/widgets/message_card.dart';

class AppBlocStateHandling {
  ///////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////   ** FAKE-DATA **  /////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////
  final fakeProject = List.filled(
    7,
    ProjectModel(
      id: 0,
      projectType: "projectType",
      projectDescription: "projectDescription",
      requirements: [],
      document: "document",
      cooperationType: "cooperationType",
      contactTime: "contactTime",
      private: 0,
      contract: Contract(
        id: 0,
        contract: "contract",
        projectId: 0,
        contractManagerStatus: 0,
        projectManagerStatus: 0,
        clientSign: "clientSign",
        status: 0,
        clientEditRequest: null,
        needEdit: 0,
        adminSign: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      status: "status",
      team: Team(id: 0, name: "name", members: []),
    ),
  );

  final fakeContracts = List.filled(
    7,
    ContractModel(
      id: 0,
      contract: "contract",
      contractManagerStatus: 0,
      projectManagerStatus: 0,
      status: 0,
      clientEditRequest: "clientEditRequest",
      needEdit: 1,
      adminSign: 1,
      project: Project(
        id: 0,
        projectType: "projectType",
        projectDescription: "projectDescription",
        requirements: [],
        document: "document",
        cooperationType: "cooperationType",
        contactTime: "contactTime",
        clientId: 0,
        teamId: 0,
        status: "status",
        private: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        teamApproved: 0,
      ),
    ),
  );

  final fakeNotifi = List.filled(
    7,
    NotificationModel(
      id: "0000",
      message: "rejected because the cost is not acceptable",
      projectId: 0,
      project: Project(
        id: 0,
        projectType: "projectType",
        projectDescription: "projectDescription",
        requirements: [],
        document: "document",
        cooperationType: "cooperationType",
        contactTime: "contactTime",
        clientId: 0,
        teamId: 0,
        status: "status",
        private: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        teamApproved: 0,
      ),
    ),
  );

  final fakeMessages = List.filled(7, MessageModel(message: "Message"));

  final fakeMeeting = List.filled(
    7,
    MeetingModel(
      id: 0,
      date: DateTime.now(),
      meetingType: "meetingType",
      projectId: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  );

  ///////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////   ** AUTH-PAGE **  /////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////

  Future<void> login(AppState state, BuildContext context) async {
    if (state.userModelStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.userModelStatus == CasualStatus.success) {
      context.pop();
      await SharedPreferencesServices.setUserToken(state.userModel!.token);
      showSuccessDialog(
        context,
        () => context.pushReplacementNamed(AppRouteConfig.home),
      );
    } else if (state.userModelStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.errorMessage);
    } else {
      const SizedBox();
    }
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////   ** HOME-PAGE **  /////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////

  Widget getUserHeader(AppState state, BuildContext context) {
    if (state.userHeaderStatus == CasualStatus.success) {
      return GestureDetector(
        onTap: () => context.goNamed(AppRouteConfig.profile),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FetchNetworkImage(imagePath: state.userHeader!.image),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, ${state.userHeader!.name}',
                    style: AppTextStyle.bodyMd(color: AppColors.white),
                  ),
                  Text(
                    'Let’s work casually',
                    style: AppTextStyle.bodySm(color: AppColors.fontLightColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Skeletonizer(
        enabled: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(backgroundImage: AssetImage(ImagesPath.profile)),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, Steve',
                    style: AppTextStyle.bodyMd(color: AppColors.white),
                  ),
                  Text(
                    'Let’s work casually',
                    style: AppTextStyle.bodySm(color: AppColors.fontLightColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget getHomeProjectList(AppState state) {
    if (state.homeProjectListStatus == CasualStatus.loading) {
      return Skeletonizer(
        enabled: true,
        child: PageView.builder(
          itemCount: fakeProject.length,
          itemBuilder: (context, index) =>
              CustomProjectCard(projectModel: fakeProject[index]),
        ),
      );
    } else if (state.homeProjectListStatus == CasualStatus.success) {
      if (state.homeProjectList.isEmpty) {
        return EmptyStatusAnimation();
      } else {
        return PageView.builder(
          itemCount: state.homeProjectList.length,
          itemBuilder: (context, index) =>
              CustomProjectCard(projectModel: state.homeProjectList[index]),
        );
      }
    } else if (state.homeProjectListStatus == CasualStatus.failure) {
      return ErrorStatusBox(errorMessage: state.errorMessage);
    } else {
      return SizedBox();
    }
  }

  Widget getHomeContractList(AppState state) {
    if (state.homeContractListStatus == CasualStatus.loading) {
      return Skeletonizer(
        enabled: true,
        effect: ShimmerEffect(),
        child: ListView.builder(
          itemCount: fakeContracts.length,
          itemBuilder: (context, index) =>
              CustomContractListTile(contract: fakeContracts[index]),
        ),
      );
    } else if (state.homeContractListStatus == CasualStatus.success) {
      if (state.homeContractList.isEmpty) {
        return EmptyStatusAnimation(width: 90, height: 90);
      } else {
        return ListView.builder(
          itemCount: state.homeContractList.length,
          itemBuilder: (context, index) =>
              CustomContractListTile(contract: state.homeContractList[index]),
        );
      }
    } else if (state.homeContractListStatus == CasualStatus.failure) {
      return Text(
        state.errorMessage,
        style: AppTextStyle.bodySm(color: AppColors.red2),
      );
    } else {
      return SizedBox();
    }
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////   ** NOTIFICATION-PAGE **  /////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////

  Widget showUnReadNotificationList(AppState state) {
    if (state.unreadNotifiListStatus == CasualStatus.loading) {
      return Skeletonizer(
        enabled: true,
        child: Expanded(
          child: ListView.builder(
            itemCount: fakeNotifi.length,
            itemBuilder: (context, index) =>
                NotificationCard(notificationModel: fakeNotifi[index]),
          ),
        ),
      );
    } else if (state.unreadNotifiListStatus == CasualStatus.success) {
      return ListView.builder(
        itemCount: state.unreadNotifiList.length,
        itemBuilder: (context, index) =>
            NotificationCard(notificationModel: state.unreadNotifiList[index]),
      );
    } else if (state.unreadNotifiListStatus == CasualStatus.failure) {
      return ErrorStatusBox(errorMessage: state.errorMessage);
    } else {
      return SizedBox();
    }
  }
  ///////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////   ** PROJECT-PAGE **  //////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////

  Widget showProjectList(AppState state) {
    if (state.projectListStatus == CasualStatus.loading) {
      return Skeletonizer(
        enabled: true,
        child: Expanded(
          child: ListView.builder(
            itemCount: fakeProject.length,
            itemBuilder: (context, index) =>
                CustomProjectCard(projectModel: fakeProject[index]),
          ),
        ),
      );
    } else if (state.projectListStatus == CasualStatus.success) {
      final list = state.projectList;
      if (list.isEmpty) {
        return EmptyStatusAnimation();
      } else {
        return Expanded(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) =>
                CustomProjectCard(projectModel: list[index]),
          ),
        );
      }
    } else if (state.projectListStatus == CasualStatus.failure) {
      return ErrorStatusBox(errorMessage: state.errorMessage);
    } else {
      return const SizedBox();
    }
  }

  Widget showRecentProjectList(AppState state) {
    if (state.homeProjectListStatus == CasualStatus.loading) {
      return Skeletonizer(
        enabled: true,
        child: Expanded(
          child: ListView.builder(
            itemCount: fakeProject.length,
            itemBuilder: (context, index) =>
                CustomProjectCard(projectModel: fakeProject[index]),
          ),
        ),
      );
    } else if (state.homeProjectListStatus == CasualStatus.success) {
      final list = state.homeProjectList;
      if (list.isEmpty) {
        return EmptyStatusAnimation();
      } else {
        return Expanded(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) =>
                CustomProjectCard(projectModel: list[index]),
          ),
        );
      }
    } else if (state.homeProjectListStatus == CasualStatus.failure) {
      return ErrorStatusBox(errorMessage: state.errorMessage);
    } else {
      return const SizedBox();
    }
  }

  Future<void> sentEditProjectRequest(
    AppState state,
    BuildContext context,
  ) async {
    if (state.sentEditProjectRequestStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.sentEditProjectRequestStatus == CasualStatus.success) {
      context.pop();
      showSuccessDialog(context, () => context.pop());
    } else if (state.sentEditProjectRequestStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.errorMessage);
    } else {
      const SizedBox();
    }
  }

  Widget showEditProjectRequestList(AppState state) {
    if (state.showProjectEditRequestListStatus == CasualStatus.loading) {
      return Skeletonizer(
        enabled: true,
        child: Expanded(
          child: ListView.builder(
            itemCount: fakeMessages.length,
            itemBuilder: (context, index) =>
                MessageCard(messageModel: fakeMessages[index]),
          ),
        ),
      );
    } else if (state.showProjectEditRequestListStatus == CasualStatus.success) {
      return ListView.builder(
        itemCount: state.showProjectEditRequestList.length,
        itemBuilder: (context, index) =>
            MessageCard(messageModel: state.showProjectEditRequestList[index]),
      );
    } else if (state.showProjectEditRequestListStatus == CasualStatus.failure) {
      return ErrorStatusBox(errorMessage: state.errorMessage);
    } else {
      return SizedBox();
    }
  }

  Widget showProjectMeetingList(AppState state) {
    if (state.projectMeetingListStatus == CasualStatus.loading) {
      return Skeletonizer(
        enabled: true,
        child: Expanded(
          child: ListView.builder(
            itemCount: fakeMeeting.length,
            itemBuilder: (context, index) =>
                MeetingCard(meetingModel: fakeMeeting[index]),
          ),
        ),
      );
    } else if (state.projectMeetingListStatus == CasualStatus.success) {
      return ListView.builder(
        itemCount: state.projectMeetingList.length,
        itemBuilder: (context, index) =>
            MeetingCard(meetingModel: state.projectMeetingList[index]),
      );
    } else if (state.projectMeetingListStatus == CasualStatus.failure) {
      return ErrorStatusBox(errorMessage: state.errorMessage);
    } else {
      return SizedBox();
    }
  }

  Future<void> createProject(AppState state, BuildContext context) async {
    if (state.createProjectStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.createProjectStatus == CasualStatus.success) {
      context.pop();
      showSuccessDialog(context, () {
        context.goNamed(AppRouteConfig.home);
        context.read<AppBloc>().add(GetHomeProjectListEvent());
        context.pop();
      });
    } else if (state.createProjectStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.errorMessage);
    } else {
      const SizedBox();
    }
  }

  Future<void> updateProject(AppState state, BuildContext context) async {
    if (state.updateProjectStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.updateProjectStatus == CasualStatus.success) {
      context.pop();
      showSuccessDialog(context, () => context.pop());
    } else if (state.updateProjectStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.errorMessage);
    } else {
      const SizedBox();
    }
  }

  Future<void> rateProject(AppState state, BuildContext context) async {
    if (state.rateProjectStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.rateProjectStatus == CasualStatus.success) {
      context.pop();
      showSuccessDialog(context, () => context.pop());
    } else if (state.rateProjectStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.errorMessage);
    } else {
      const SizedBox();
    }
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////   ** CONTRACT-PAGE **  /////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////

  Widget showContractList(AppState state) {
    if (state.contractListStatus == CasualStatus.loading) {
      return Skeletonizer(
        enabled: true,
        child: Expanded(
          child: ListView.builder(
            itemCount: fakeContracts.length,
            itemBuilder: (context, index) =>
                CustomContractListTile(contract: fakeContracts[index]),
          ),
        ),
      );
    } else if (state.contractListStatus == CasualStatus.success) {
      final list = state.contractList;
      return Expanded(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) =>
              CustomContractListTile(contract: list[index]),
        ),
      );
    } else if (state.contractListStatus == CasualStatus.failure) {
      return ErrorStatusBox(errorMessage: state.errorMessage);
    } else {
      return const SizedBox();
    }
  }

  Future<void> sentEditContractRequest(
    AppState state,
    BuildContext context,
  ) async {
    if (state.sentEditContractRequestStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.sentEditContractRequestStatus == CasualStatus.success) {
      context.pop();
      showSuccessDialog(context, () => context.pop());
    } else if (state.sentEditContractRequestStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.errorMessage);
    } else {
      const SizedBox();
    }
  }

  Future<void> signContract(AppState state, BuildContext context) async {
    if (state.signContractStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.signContractStatus == CasualStatus.success) {
      context.pop();
      showSuccessDialog(context, () => context.pop());
    } else if (state.signContractStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.errorMessage);
    } else {
      const SizedBox();
    }
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////   ** PROFILE-PAGE **  //////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////

  Widget getUserProfile(AppState state) {
    if (state.userProfileStatus == CasualStatus.loading) {
      return Skeletonizer(
        enabled: true,
        child: Column(
          children: [
            FetchNetworkImage(imagePath: "Some Text", height: 150, width: 150),
            PaddingConfig.h8,
            Text("Some Text", style: AppTextStyle.headerSm()),
            Text(
              "Some Text",
              style: AppTextStyle.bodySm(color: AppColors.fontLightColor),
            ),
          ],
        ),
      );
    } else if (state.userProfileStatus == CasualStatus.success) {
      return Column(
        children: [
          FetchNetworkImage(
            imagePath: state.userProfile!.image,
            height: 150,
            width: 150,
          ),
          PaddingConfig.h8,
          Text(
            state.userProfile!.name,
            style: AppTextStyle.headerSm(color: AppColors.white),
          ),
          Text(
            state.userProfile!.email,
            style: AppTextStyle.bodySm(color: AppColors.gray1),
          ),
        ],
      );
    } else if (state.userProfileStatus == CasualStatus.failure) {
      return ErrorStatusBox(errorMessage: state.errorMessage);
    } else {
      return const SizedBox();
    }
  }

  void logoutStateHandling(AppState state, BuildContext context) async {
    if (state.logoutStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.logoutStatus == CasualStatus.success) {
      context.pop();
      await SharedPreferencesServices.deleteUserToken();
      showSuccessDialog(context, () {
        context.pushReplacementNamed(AppRouteConfig.login);
        context.pop();
      });
    } else if (state.logoutStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.errorMessage);
    } else if (state.logoutStatus == CasualStatus.noToken) {
      context.pop();
    }
  }
}
