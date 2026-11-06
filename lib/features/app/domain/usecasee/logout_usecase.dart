import 'package:dartz/dartz.dart';
import 'package:two_client_app/core/usecases/usecase.dart';
import 'package:two_client_app/features/app/domain/repos/app_repo.dart';

import '../../../../core/error/failures.dart';

class LogoutUsecase extends UseCase<Future<Either<Failure, Unit>>, String> {
  final AppRepo appRepo;
  LogoutUsecase(this.appRepo);

  @override
  Future<Either<Failure, Unit>> call(String param) async {
    return await appRepo.logout(param);
  }
}
