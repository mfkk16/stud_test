import 'package:stud_test/Domain/Core/resource/data_state.dart';
import 'package:stud_test/Domain/Core/usecase.dart';
import 'package:stud_test/Domain/Models/classroom_model.dart';
import 'package:stud_test/Domain/Models/students_model.dart';
import 'package:stud_test/Domain/Models/subjects_model.dart';
import 'package:stud_test/Infrastructure/network_repo.dart';

class GetClassroomsUsecase implements Usecase<DataState<ClassroomsModel>, void> {
  final NetworkRepo _networkRepo;

  GetClassroomsUsecase(this._networkRepo);

  @override
  Future<DataState<ClassroomsModel>> call({void params}) async {
    return await _networkRepo.getClassrooms();
  }
}
