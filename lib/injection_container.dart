import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:two_client_app/core/network/network_connection_checker.dart';
import 'package:two_client_app/features/app/bloc/app_bloc.dart';
import 'package:two_client_app/features/app/data/datasource/app_remote_datasource.dart';
import 'package:two_client_app/features/app/data/repo/app_repo_impl.dart';
import 'package:two_client_app/features/app/domain/repos/app_repo.dart';
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

final sl = GetIt.instance;

Future<void> init() async {
  /**----------------- APP FEATURE -----------------------**/
  // Bloc
  sl.registerFactory(
    () => AppBloc(
      loginUsecase: sl(),
      logoutUsecase: sl(),
      getUserProfileUsecase: sl(),
      getProjectListUsecase: sl(),
      sentEditProjectRequestUsecase: sl(),
      getContractListUsecase: sl(),
      sentEditContractRequestUsecase: sl(),
      showProjectEditRequestUsecase: sl(),
      createProjectUsecase: sl(),
      updateProjectUsecase: sl(),
      rateProjectUsecase: sl(),
      showProjectMeetingListUsecase: sl(),
      signContractUsecase: sl(),
      getNotificationUsecase: sl(),
      getUnreadNotificationUsecase: sl(),
    ),
  );
  // Usecases
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  sl.registerLazySingleton(() => LogoutUsecase(sl()));
  sl.registerLazySingleton(() => GetUserProfileUsecase(sl()));
  sl.registerLazySingleton(() => GetProjectListUsecase(sl()));
  sl.registerLazySingleton(() => SentEditProjectRequestUsecase(sl()));
  sl.registerLazySingleton(() => ShowProjectEditRequestUsecase(sl()));
  sl.registerLazySingleton(() => CreateProjectUsecase(sl()));
  sl.registerLazySingleton(() => UpdateProjectUsecase(sl()));
  sl.registerLazySingleton(() => RateProjectUsecase(sl()));
  sl.registerLazySingleton(() => ShowProjectMeetingListUsecase(sl()));
  sl.registerLazySingleton(() => GetContractListUsecase(sl()));
  sl.registerLazySingleton(() => SentEditContractRequestUsecase(sl()));
  sl.registerLazySingleton(() => SignContractUsecase(sl()));
  sl.registerLazySingleton(() => GetNotificationUsecase(sl()));
  sl.registerLazySingleton(() => GetUnreadNotificationUsecase(sl()));

  // Repos
  sl.registerLazySingleton<AppRepo>(() => AppRepoImpl(sl()));
  // Datasources
  sl.registerLazySingleton<AppRemoteDatasource>(
    () => AppRemoteDatasourceImpl(),
  );

  ///////////////////////////////////////////////////////////////////////////////////////

  /* CORE */
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  /* External */

  final sharedPreferences = await SharedPreferences.getInstance();
  final internetConnectionChecker = InternetConnectionChecker.createInstance();
  final networkInfo = NetworkInfoImpl(internetConnectionChecker);
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => internetConnectionChecker);
  sl.registerLazySingleton(() => networkInfo);
}
