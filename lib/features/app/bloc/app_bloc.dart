import 'package:bloc/bloc.dart';

import 'package:two_client_app/core/network/enums.dart';
import 'package:two_client_app/core/param/app_param.dart';
import 'package:two_client_app/core/param/casule_param.dart';
import 'package:two_client_app/core/services/shared_preferences_services.dart';
import 'package:two_client_app/features/app/data/models/response-models/login_response_model.dart';
import 'package:two_client_app/features/app/data/models/single-models/contract_model.dart';
import 'package:two_client_app/features/app/data/models/single-models/meeting_model.dart';
import 'package:two_client_app/features/app/data/models/single-models/message_model.dart';
import 'package:two_client_app/features/app/data/models/single-models/notification_model.dart';
import 'package:two_client_app/features/app/data/models/single-models/profile_model.dart';
import 'package:two_client_app/features/app/data/models/single-models/project_model.dart';
import 'package:two_client_app/features/app/domain/usecasee/create_project_usecase.dart';
import 'package:two_client_app/features/app/domain/usecasee/get_user_profile_usecase.dart';
import 'package:two_client_app/features/app/domain/usecasee/login_usecase.dart';
import 'package:two_client_app/features/app/domain/usecasee/logout_usecase.dart';
import 'package:two_client_app/features/app/domain/usecasee/rate_project_usecase.dart';
import 'package:two_client_app/features/app/domain/usecasee/sent_edit_contract_request_usecase.dart';
import 'package:two_client_app/features/app/domain/usecasee/sent_edit_project_request_usecase.dart';
import 'package:two_client_app/features/app/domain/usecasee/show_contract_list_usecase.dart';
import 'package:two_client_app/features/app/domain/usecasee/show_notification_usecase.dart';
import 'package:two_client_app/features/app/domain/usecasee/show_project_edit_request_usecase.dart';
import 'package:two_client_app/features/app/domain/usecasee/show_project_list_usecase.dart';
import 'package:two_client_app/features/app/domain/usecasee/show_project_meeting_list_usecase.dart';
import 'package:two_client_app/features/app/domain/usecasee/show_unread_notification_usecase.dart';
import 'package:two_client_app/features/app/domain/usecasee/sign_contract_usecase.dart';
import 'package:two_client_app/features/app/domain/usecasee/update_project_usecase.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final LoginUsecase loginUsecase;
  final LogoutUsecase logoutUsecase;
  final GetUserProfileUsecase getUserProfileUsecase;
  final GetProjectListUsecase getProjectListUsecase;
  final SentEditProjectRequestUsecase sentEditProjectRequestUsecase;
  final ShowProjectEditRequestUsecase showProjectEditRequestUsecase;
  final CreateProjectUsecase createProjectUsecase;
  final UpdateProjectUsecase updateProjectUsecase;
  final RateProjectUsecase rateProjectUsecase;
  final ShowProjectMeetingListUsecase showProjectMeetingListUsecase;
  final GetContractListUsecase getContractListUsecase;
  final SentEditContractRequestUsecase sentEditContractRequestUsecase;
  final SignContractUsecase signContractUsecase;
  final GetNotificationUsecase getNotificationUsecase;
  final GetUnreadNotificationUsecase getUnreadNotificationUsecase;
  AppBloc({
    required this.loginUsecase,
    required this.logoutUsecase,
    required this.getUserProfileUsecase,
    required this.getProjectListUsecase,
    required this.sentEditProjectRequestUsecase,
    required this.showProjectEditRequestUsecase,
    required this.createProjectUsecase,
    required this.updateProjectUsecase,
    required this.rateProjectUsecase,
    required this.showProjectMeetingListUsecase,
    required this.getContractListUsecase,
    required this.sentEditContractRequestUsecase,
    required this.signContractUsecase,
    required this.getNotificationUsecase,
    required this.getUnreadNotificationUsecase,
  }) : super(AppState()) {
    ///////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////
    // Login Events
    on<LoginEvent>((event, emit) async {
      emit(state.copyWith(userModelStatus: CasualStatus.loading));
      final result = await loginUsecase.call(
        LoginParam(email: event.email, password: event.password),
      );
      result.fold(
        (l) => emit(state.copyWith(userModelStatus: CasualStatus.failure)),
        (r) => emit(
          state.copyWith(userModelStatus: CasualStatus.success, userModel: r),
        ),
      );
    });
    // Notification Events
    on<GetNotificationEvent>((event, emit) async {
      emit(state.copyWith(notificationStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await getNotificationUsecase.call(
          TokenWithIdParam(token: token, id: event.id),
        );
        result.fold(
          (l) => emit(state.copyWith(notificationStatus: CasualStatus.failure)),
          (r) => emit(state.copyWith(notificationStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(notificationStatus: CasualStatus.notAuthorized));
      }
    });
    on<GetUnreadNotificationEvent>((event, emit) async {
      emit(state.copyWith(unreadNotifiListStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await getUnreadNotificationUsecase.call(token);
        result.fold(
          (l) => emit(
            state.copyWith(unreadNotifiListStatus: CasualStatus.failure),
          ),
          (r) => emit(
            state.copyWith(
              unreadNotifiListStatus: CasualStatus.success,
              unreadNotifiList: r,
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(unreadNotifiListStatus: CasualStatus.notAuthorized),
        );
      }
    });
    ///////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////
    // Home Events
    on<GetUserHeader>((event, emit) async {
      emit(state.copyWith(userHeaderStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await getUserProfileUsecase.call(token);
        result.fold(
          (l) => emit(
            state.copyWith(
              userHeaderStatus: CasualStatus.failure,
              errorMessage: l.message,
            ),
          ),
          (r) => emit(
            state.copyWith(
              userHeaderStatus: CasualStatus.success,
              userHeader: r,
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            userHeaderStatus: CasualStatus.notAuthorized,
            errorMessage: "Token Is Empty !!!",
          ),
        );
      }
    });
    on<GetHomeProjectListEvent>((event, emit) async {
      emit(state.copyWith(homeProjectListStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await getProjectListUsecase.call(token);
        result.fold(
          (l) => emit(
            state.copyWith(
              homeProjectListStatus: CasualStatus.failure,
              errorMessage: l.message,
            ),
          ),
          (r) => emit(
            state.copyWith(
              homeProjectListStatus: CasualStatus.success,
              homeProjectList: r,
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            homeProjectListStatus: CasualStatus.notAuthorized,
            errorMessage: "Token Is Empty !!!",
          ),
        );
      }
    });
    on<GetHomeContractEvent>((event, emit) async {
      emit(state.copyWith(homeContractListStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await getContractListUsecase.call(
          ShowContractListParam(
            token: token,
            statusFilter: event.statusFilter ?? 0,
          ),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              homeContractListStatus: CasualStatus.failure,
              errorMessage: l.message,
            ),
          ),
          (r) => emit(
            state.copyWith(
              homeContractListStatus: CasualStatus.success,
              homeContractList: r,
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            homeContractListStatus: CasualStatus.notAuthorized,
            errorMessage: "Token Is Empty !!!",
          ),
        );
      }
    });
    ///////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////
    // Project Events
    on<GetProjectListEvent>((event, emit) async {
      emit(state.copyWith(projectListStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await getProjectListUsecase.call(token);
        result.fold(
          (l) => emit(
            state.copyWith(
              projectListStatus: CasualStatus.failure,
              errorMessage: l.message,
            ),
          ),
          (r) => emit(
            state.copyWith(
              projectListStatus: CasualStatus.success,
              projectList: r,
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            projectListStatus: CasualStatus.notAuthorized,
            errorMessage: "Token Is Empty !!!",
          ),
        );
      }
    });
    on<SentEditProjectRequestEvent>((event, emit) async {
      emit(state.copyWith(sentEditProjectRequestStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await sentEditProjectRequestUsecase.call(
          EditProjectRequestParam(
            token: token,
            projectId: event.projectId,
            editMessage: event.editMessage,
          ),
        );
        result.fold(
          (l) => emit(
            state.copyWith(sentEditProjectRequestStatus: CasualStatus.failure),
          ),
          (r) => emit(
            state.copyWith(sentEditProjectRequestStatus: CasualStatus.success),
          ),
        );
      } else {
        emit(
          state.copyWith(
            sentEditProjectRequestStatus: CasualStatus.notAuthorized,
          ),
        );
      }
    });
    on<ShowProjectEditRequestsEvent>((event, emit) async {
      emit(
        state.copyWith(showProjectEditRequestListStatus: CasualStatus.loading),
      );
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await showProjectEditRequestUsecase.call(
          ShowProjectEditRequestParam(projectId: event.projectId, token: token),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              showProjectEditRequestListStatus: CasualStatus.failure,
            ),
          ),
          (r) => emit(
            state.copyWith(
              showProjectEditRequestListStatus: CasualStatus.success,
              showProjectEditRequestList: r,
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            showProjectEditRequestListStatus: CasualStatus.notAuthorized,
          ),
        );
      }
    });
    on<CreateProjectEvent>((event, emit) async {
      emit(state.copyWith(createProjectStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await createProjectUsecase.call(
          CreateProjectParam(
            token: token,
            type: event.projectType,
            description: event.projectDescription,
            requirements: event.requirements,
            document: event.document,
            cooperationType: event.cooperationType,
            contactTime: event.contactTime,
          ),
        );
        result.fold(
          (l) =>
              emit(state.copyWith(createProjectStatus: CasualStatus.failure)),
          (r) =>
              emit(state.copyWith(createProjectStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(createProjectStatus: CasualStatus.notAuthorized));
      }
    });
    on<UpdateProjectEvent>((event, emit) async {
      emit(state.copyWith(updateProjectStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await updateProjectUsecase.call(
          UpdateProjectParam(
            token: token,
            projectId: event.projectId,
            projectType: event.projectType,
            projectDescription: event.projectDescription,
            requirements: event.requirements,
            cooperationType: event.cooperationType,
            contactTime: event.contactTime,
            visibility: event.visibility,
          ),
        );
        result.fold(
          (l) =>
              emit(state.copyWith(updateProjectStatus: CasualStatus.failure)),
          (r) =>
              emit(state.copyWith(updateProjectStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(updateProjectStatus: CasualStatus.notAuthorized));
      }
    });
    on<RateProjectEvent>((event, emit) async {
      emit(state.copyWith(rateProjectStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await rateProjectUsecase.call(
          RateProjectParam(
            token: token,
            projectId: event.projectId.toString(),
            rating: event.rating.toString(),
          ),
        );
        result.fold(
          (l) => emit(state.copyWith(rateProjectStatus: CasualStatus.failure)),
          (r) => emit(state.copyWith(rateProjectStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(rateProjectStatus: CasualStatus.notAuthorized));
      }
    });
    on<ShowProjectMeetingsListEvent>((event, emit) async {
      emit(state.copyWith(projectMeetingListStatus: CasualStatus.loading));
      final result = await showProjectMeetingListUsecase.call(event.projectId);
      result.fold(
        (l) => emit(
          state.copyWith(projectMeetingListStatus: CasualStatus.failure),
        ),
        (r) => emit(
          state.copyWith(
            projectMeetingListStatus: CasualStatus.success,
            projectMeetingList: r,
          ),
        ),
      );
    });
    ///////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////
    // Contract Events
    on<GetContractListEvent>((event, emit) async {
      emit(state.copyWith(contractListStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await getContractListUsecase.call(
          ShowContractListParam(
            token: token,
            statusFilter: event.statusFilter ?? 0,
          ),
        );
        result.fold(
          (l) => emit(state.copyWith(contractListStatus: CasualStatus.failure)),
          (r) => emit(
            state.copyWith(
              contractListStatus: CasualStatus.success,
              contractList: r,
            ),
          ),
        );
      } else {
        emit(state.copyWith(contractListStatus: CasualStatus.notAuthorized));
      }
    });
    on<SentEditContractRequestEvent>((event, emit) async {
      emit(state.copyWith(sentEditContractRequestStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await sentEditContractRequestUsecase.call(
          EditContractRequestParam(
            token: token,
            editMessage: event.editMessage,
            contractId: event.contractId,
          ),
        );
        result.fold(
          (l) => emit(
            state.copyWith(sentEditContractRequestStatus: CasualStatus.failure),
          ),
          (r) => emit(
            state.copyWith(sentEditContractRequestStatus: CasualStatus.success),
          ),
        );
      } else {
        emit(
          state.copyWith(
            sentEditContractRequestStatus: CasualStatus.notAuthorized,
          ),
        );
      }
    });
    on<SignContractEvent>((event, emit) async {
      emit(state.copyWith(signContractStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await signContractUsecase.call(
          SignContractParam(
            token: token,
            signature: event.signature,
            contractId: event.contractId,
          ),
        );
        result.fold(
          (l) => emit(state.copyWith(signContractStatus: CasualStatus.failure)),
          (r) => emit(state.copyWith(signContractStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(signContractStatus: CasualStatus.notAuthorized));
      }
    });
    ///////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////
    // Profile Events
    on<GetUserProfileEvent>((event, emit) async {
      emit(state.copyWith(userProfileStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await getUserProfileUsecase.call(token);
        result.fold(
          (l) => emit(state.copyWith(userProfileStatus: CasualStatus.failure)),
          (r) => emit(
            state.copyWith(
              userProfileStatus: CasualStatus.success,
              userProfile: r,
            ),
          ),
        );
      } else {
        emit(state.copyWith(userProfileStatus: CasualStatus.notAuthorized));
      }
    });

    on<LogoutEvent>((event, emit) async {
      emit(state.copyWith(logoutStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await logoutUsecase.call(token);
        result.fold(
          (l) => emit(
            state.copyWith(
              logoutStatus: CasualStatus.failure,
              errorMessage: l.message,
            ),
          ),
          (r) => emit(state.copyWith(logoutStatus: CasualStatus.success)),
        );
      } else {
        emit(
          state.copyWith(
            logoutStatus: CasualStatus.noToken,
            errorMessage: "No Token",
          ),
        );
      }
    });
  }
}
