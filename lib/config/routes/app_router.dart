import 'package:go_router/go_router.dart';
import 'package:two_client_app/core/widgets/main_page.dart';
import 'package:two_client_app/features/app/data/models/single-models/contract_model.dart';
import 'package:two_client_app/features/app/data/models/single-models/project_model.dart';
import 'package:two_client_app/features/contract/pages/contract_detailes_page.dart';
import 'package:two_client_app/features/contract/pages/contract_page.dart';
import 'package:two_client_app/features/contract/pages/pdf_viewer_page.dart';
import 'package:two_client_app/features/contract/pages/signature_page.dart';
import 'package:two_client_app/features/home/pages/home_page.dart';
import 'package:two_client_app/features/home/pages/notification_page.dart';
import 'package:two_client_app/features/intro/pages/on_board_page.dart';
import 'package:two_client_app/features/profile/pages/profile_page.dart';
import 'package:two_client_app/features/projects/pages/create_project_page.dart';
import 'package:two_client_app/features/projects/pages/edit_project_request_page.dart';
import 'package:two_client_app/features/projects/pages/project_detailes_page.dart';
import 'package:two_client_app/features/projects/pages/project_meeting_page.dart';
import 'package:two_client_app/features/projects/pages/projects_page.dart';
import 'package:two_client_app/features/projects/pages/recent_project_page.dart';
import 'package:two_client_app/features/projects/pages/update_project_page.dart';

import '../../features/auth/pages/login_page.dart';
import '../../features/intro/pages/splash_page.dart';
import 'app_route_config.dart';

class AppRouter {
  GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: AppRouteConfig.splash,
        path: '/',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        name: AppRouteConfig.onboard,
        path: '/onboard',
        builder: (context, state) => const OnBoardPage(),
      ),
      GoRoute(
        name: AppRouteConfig.login,
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => MainPage(shell: shell),
        branches: [
          // Home
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouteConfig.home,
                path: '/home',
                builder: (context, state) => const HomePage(),
              ),
              GoRoute(
                name: AppRouteConfig.notification,
                path: '/notification',
                builder: (context, state) => const NotificationPage(),
              ),
              GoRoute(
                name: AppRouteConfig.recentproject,
                path: '/recent-project',
                builder: (context, state) => const RecentprojectPage(),
              ),
            ],
          ),
          // Project
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouteConfig.project,
                path: '/project',
                builder: (context, state) => const ProjectsPage(),
              ),
              GoRoute(
                name: AppRouteConfig.projectDetailes,
                path: '/project-detailes',
                builder: (context, state) => ProjectDetailesPage(
                  projectModel: state.extra as ProjectModel,
                ),
              ),
              GoRoute(
                name: AppRouteConfig.projectEditRequests,
                path: '/project-edit-requests',
                builder: (context, state) =>
                    EditProjectRequestPage(projectId: state.extra as int),
              ),
              GoRoute(
                name: AppRouteConfig.projectMeetings,
                path: '/project-meetings',
                builder: (context, state) =>
                    ProjectMeetingPage(projectId: state.extra as int),
              ),
              GoRoute(
                name: AppRouteConfig.updateProject,
                path: '/update-project',
                builder: (context, state) => UpdateProjectPage(
                  projectModel: state.extra as ProjectModel,
                ),
              ),
            ],
          ),
          // Create Project
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouteConfig.createProject,
                path: '/create-project',
                builder: (context, state) => CreateProjectPage(),
              ),
            ],
          ),
          // Contract
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouteConfig.contract,
                path: '/contract',
                builder: (context, state) => const ContractPage(),
              ),
              GoRoute(
                name: AppRouteConfig.contractDetails,
                path: '/contract-details',
                builder: (context, state) => ContractDetailesPage(
                  contract: state.extra as ContractModel,
                ),
              ),
              GoRoute(
                name: AppRouteConfig.pdfViewer,
                path: '/pdf-viewer/:pdfUrl/:id',
                builder: (context, state) => PdfViewerPage(
                  pdfUrl: state.pathParameters['pdfUrl'] ?? '',
                  contractId: state.pathParameters['id'] ?? '',
                ),
              ),
              GoRoute(
                name: AppRouteConfig.signature,
                path: '/signature/:pdfUrl/:id',
                builder: (context, state) => SignaturePage(
                  pdfUrl: state.pathParameters['pdfUrl'] ?? '',
                  contractId: state.pathParameters['id'] ?? '',
                ),
              ),
            ],
          ),
          // Profile
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouteConfig.profile,
                path: '/profile',
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
