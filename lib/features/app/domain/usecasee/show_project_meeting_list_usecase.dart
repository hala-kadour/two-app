import 'package:dartz/dartz.dart';
import 'package:two_client_app/core/error/failures.dart';
import 'package:two_client_app/core/usecases/usecase.dart';
import 'package:two_client_app/features/app/data/models/single-models/meeting_model.dart';
import 'package:two_client_app/features/app/domain/repos/app_repo.dart';

class ShowProjectMeetingListUsecase
    extends UseCase<Future<Either<Failure, List<MeetingModel>>>, int> {
  final AppRepo appRepo;

  ShowProjectMeetingListUsecase(this.appRepo);

  @override
  Future<Either<Failure, List<MeetingModel>>> call(int param) {
    return appRepo.showProjectMeetingList(param);
  }
}
