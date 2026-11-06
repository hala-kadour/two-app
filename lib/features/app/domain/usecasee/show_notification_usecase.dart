import 'package:dartz/dartz.dart';
import 'package:two_client_app/core/error/failures.dart';
import 'package:two_client_app/core/param/casule_param.dart';
import 'package:two_client_app/core/usecases/usecase.dart';
import 'package:two_client_app/features/app/data/models/single-models/notification_model.dart';
import 'package:two_client_app/features/app/domain/repos/app_repo.dart';

class GetNotificationUsecase
    extends
        UseCase<Future<Either<Failure, NotificationModel>>, TokenWithIdParam> {
  final AppRepo appRepo;

  GetNotificationUsecase(this.appRepo);

  @override
  Future<Either<Failure, NotificationModel>> call(TokenWithIdParam param) {
    return appRepo.showNotification(param);
  }
}
