import 'package:dartz/dartz.dart';
import 'package:two_client_app/core/error/failures.dart';
import 'package:two_client_app/core/param/app_param.dart';
import 'package:two_client_app/core/usecases/usecase.dart';
import 'package:two_client_app/features/app/data/models/single-models/message_model.dart';
import 'package:two_client_app/features/app/domain/repos/app_repo.dart';

class ShowProjectEditRequestUsecase
    extends
        UseCase<
          Future<Either<Failure, List<MessageModel>>>,
          ShowProjectEditRequestParam
        > {
  final AppRepo appRepo;

  ShowProjectEditRequestUsecase(this.appRepo);

  @override
  Future<Either<Failure, List<MessageModel>>> call(
    ShowProjectEditRequestParam param,
  ) {
    return appRepo.showProjectEditRequest(param);
  }
}
