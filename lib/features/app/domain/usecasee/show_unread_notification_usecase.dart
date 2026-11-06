import 'package:dartz/dartz.dart';
import 'package:two_client_app/core/error/failures.dart';
import 'package:two_client_app/core/usecases/usecase.dart';
import 'package:two_client_app/features/app/data/models/single-models/notification_model.dart';
import 'package:two_client_app/features/app/domain/repos/app_repo.dart';

class GetUnreadNotificationUsecase
    extends UseCase<Future<Either<Failure, List<NotificationModel>>>, String> {
  final AppRepo appRepo;

  GetUnreadNotificationUsecase(this.appRepo);

  @override
  Future<Either<Failure, List<NotificationModel>>> call(String param) {
    return appRepo.showUnReadNotification(param);
  }
}
