import 'package:stud_test/Domain/Core/resource/data_state.dart';
import 'package:stud_test/Domain/Core/usecase.dart';
import 'package:stud_test/Domain/Models/subjects_model.dart';
import 'package:stud_test/Infrastructure/network_repo.dart';

class GetSubjectsUsecase implements Usecase<DataState<SubjectsModel>, void> {
  final NetworkRepo _networkRepo;

  GetSubjectsUsecase(this._networkRepo);

  @override
  Future<DataState<SubjectsModel>> call({void params}) async {
    return await _networkRepo.getSubjects();
  }
}
