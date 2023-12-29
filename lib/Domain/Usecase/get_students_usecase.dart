import 'package:stud_test/Domain/Core/resource/data_state.dart';
import 'package:stud_test/Domain/Core/usecase.dart';
import 'package:stud_test/Domain/Models/students_model.dart';
import 'package:stud_test/Infrastructure/network_repo.dart';

class GetAllStudentsUsecase implements Usecase<DataState<StudentsModel>, void> {
  final NetworkRepo _networkRepo;

  GetAllStudentsUsecase(this._networkRepo);

  @override
  Future<DataState<StudentsModel>> call({void params}) async {
    return await _networkRepo.getAllStudents();
  }
}
