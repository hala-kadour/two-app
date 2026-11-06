import 'package:dartz/dartz.dart';
import 'package:two_client_app/core/error/failures.dart';
import 'package:two_client_app/core/param/app_param.dart';
import 'package:two_client_app/core/usecases/usecase.dart';
import 'package:two_client_app/features/app/data/models/response-models/login_response_model.dart';
import 'package:two_client_app/features/app/domain/repos/app_repo.dart';

class LoginUsecase
    extends UseCase<Future<Either<Failure, UserModel>>, LoginParam> {
  final AppRepo appRepo;

  LoginUsecase(this.appRepo);

  @override
  Future<Either<Failure, UserModel>> call(LoginParam param) {
    return appRepo.login(param);
  }
}
