import 'package:dartz/dartz.dart';
import 'package:two_client_app/core/error/failures.dart';
import 'package:two_client_app/core/usecases/usecase.dart';
import 'package:two_client_app/features/app/data/models/single-models/profile_model.dart';
import 'package:two_client_app/features/app/domain/repos/app_repo.dart';

class GetUserProfileUsecase
    extends UseCase<Future<Either<Failure, ProfileModel>>, String> {
  final AppRepo appRepo;

  GetUserProfileUsecase(this.appRepo);

  @override
  Future<Either<Failure, ProfileModel>> call(String param) {
    return appRepo.getUserProfile(param);
  }
}
