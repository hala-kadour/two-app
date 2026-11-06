// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_bloc.dart';

class AppState {
  String errorMessage;
  // Login Page
  CasualStatus userModelStatus;
  UserModel? userModel;

  // Notification Page
  CasualStatus notificationStatus;
  NotificationModel? notificationModel;
  CasualStatus unreadNotifiListStatus;
  List<NotificationModel> unreadNotifiList;

  // Home Page
  CasualStatus userHeaderStatus;
  ProfileModel? userHeader;
  CasualStatus homeProjectListStatus;
  List<ProjectModel> homeProjectList;
  CasualStatus homeContractListStatus;
  List<ContractModel> homeContractList;

  // Project Page
  CasualStatus projectListStatus;
  List<ProjectModel> projectList;
  CasualStatus sentEditProjectRequestStatus;
  CasualStatus showProjectEditRequestListStatus;
  List<MessageModel> showProjectEditRequestList;
  CasualStatus createProjectStatus;
  CasualStatus updateProjectStatus;
  CasualStatus rateProjectStatus;
  CasualStatus projectMeetingListStatus;
  List<MeetingModel> projectMeetingList;

  // Contract Page
  CasualStatus contractListStatus;
  List<ContractModel> contractList;
  CasualStatus sentEditContractRequestStatus;
  CasualStatus signContractStatus;

  // Profile Page
  CasualStatus userProfileStatus;
  ProfileModel? userProfile;
  CasualStatus logoutStatus;
  AppState({
    this.errorMessage = "",
    this.userModelStatus = CasualStatus.initial,
    this.userModel,
    this.notificationStatus = CasualStatus.initial,
    this.notificationModel,
    this.unreadNotifiListStatus = CasualStatus.initial,
    this.unreadNotifiList = const [],
    this.userHeaderStatus = CasualStatus.initial,
    this.userHeader,
    this.homeProjectListStatus = CasualStatus.initial,
    this.homeProjectList = const [],
    this.homeContractListStatus = CasualStatus.initial,
    this.homeContractList = const [],
    this.projectListStatus = CasualStatus.initial,
    this.projectList = const [],
    this.sentEditProjectRequestStatus = CasualStatus.initial,
    this.showProjectEditRequestListStatus = CasualStatus.initial,
    this.showProjectEditRequestList = const [],
    this.createProjectStatus = CasualStatus.initial,
    this.updateProjectStatus = CasualStatus.initial,
    this.rateProjectStatus = CasualStatus.initial,
    this.projectMeetingListStatus = CasualStatus.initial,
    this.projectMeetingList = const [],
    this.contractListStatus = CasualStatus.initial,
    this.contractList = const [],
    this.sentEditContractRequestStatus = CasualStatus.initial,
    this.signContractStatus = CasualStatus.initial,
    this.userProfileStatus = CasualStatus.initial,
    this.userProfile,
    this.logoutStatus = CasualStatus.initial,
  });

  AppState copyWith({
    String? errorMessage,
    CasualStatus? userModelStatus,
    UserModel? userModel,
    CasualStatus? notificationStatus,
    NotificationModel? notificationModel,
    CasualStatus? unreadNotifiListStatus,
    List<NotificationModel>? unreadNotifiList,
    CasualStatus? userHeaderStatus,
    ProfileModel? userHeader,
    CasualStatus? homeProjectListStatus,
    List<ProjectModel>? homeProjectList,
    CasualStatus? homeContractListStatus,
    List<ContractModel>? homeContractList,
    CasualStatus? projectListStatus,
    List<ProjectModel>? projectList,
    CasualStatus? sentEditProjectRequestStatus,
    CasualStatus? showProjectEditRequestListStatus,
    List<MessageModel>? showProjectEditRequestList,
    CasualStatus? createProjectStatus,
    CasualStatus? updateProjectStatus,
    CasualStatus? rateProjectStatus,
    CasualStatus? projectMeetingListStatus,
    List<MeetingModel>? projectMeetingList,
    CasualStatus? contractListStatus,
    List<ContractModel>? contractList,
    CasualStatus? sentEditContractRequestStatus,
    CasualStatus? signContractStatus,
    CasualStatus? userProfileStatus,
    ProfileModel? userProfile,
    CasualStatus? logoutStatus,
  }) {
    return AppState(
      errorMessage: errorMessage ?? this.errorMessage,
      userModelStatus: userModelStatus ?? this.userModelStatus,
      userModel: userModel ?? this.userModel,
      notificationStatus: notificationStatus ?? this.notificationStatus,
      notificationModel: notificationModel ?? this.notificationModel,
      unreadNotifiListStatus:
          unreadNotifiListStatus ?? this.unreadNotifiListStatus,
      unreadNotifiList: unreadNotifiList ?? this.unreadNotifiList,
      userHeaderStatus: userHeaderStatus ?? this.userHeaderStatus,
      userHeader: userHeader ?? this.userHeader,
      homeProjectListStatus:
          homeProjectListStatus ?? this.homeProjectListStatus,
      homeProjectList: homeProjectList ?? this.homeProjectList,
      homeContractListStatus:
          homeContractListStatus ?? this.homeContractListStatus,
      homeContractList: homeContractList ?? this.homeContractList,
      projectListStatus: projectListStatus ?? this.projectListStatus,
      projectList: projectList ?? this.projectList,
      sentEditProjectRequestStatus:
          sentEditProjectRequestStatus ?? this.sentEditProjectRequestStatus,
      showProjectEditRequestListStatus:
          showProjectEditRequestListStatus ??
          this.showProjectEditRequestListStatus,
      showProjectEditRequestList:
          showProjectEditRequestList ?? this.showProjectEditRequestList,
      createProjectStatus: createProjectStatus ?? this.createProjectStatus,
      updateProjectStatus: updateProjectStatus ?? this.updateProjectStatus,
      rateProjectStatus: rateProjectStatus ?? this.rateProjectStatus,
      projectMeetingListStatus:
          projectMeetingListStatus ?? this.projectMeetingListStatus,
      projectMeetingList: projectMeetingList ?? this.projectMeetingList,
      contractListStatus: contractListStatus ?? this.contractListStatus,
      contractList: contractList ?? this.contractList,
      sentEditContractRequestStatus:
          sentEditContractRequestStatus ?? this.sentEditContractRequestStatus,
      signContractStatus: signContractStatus ?? this.signContractStatus,
      userProfileStatus: userProfileStatus ?? this.userProfileStatus,
      userProfile: userProfile ?? this.userProfile,
      logoutStatus: logoutStatus ?? this.logoutStatus,
    );
  }
}
