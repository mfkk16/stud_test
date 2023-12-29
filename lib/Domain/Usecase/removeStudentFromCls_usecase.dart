import 'package:stud_test/Domain/Core/resource/data_state.dart';
import 'package:stud_test/Domain/Core/usecase.dart';
import 'package:stud_test/Domain/Models/deleteRegistrationModel.dart';
import 'package:stud_test/Infrastructure/network_repo.dart';

class DeleteStudentToClassroom implements Usecase<DataState<DeleteRegistrationModel>, int> {
  final NetworkRepo _networkRepo;

  DeleteStudentToClassroom(this._networkRepo);

  @override
  Future<DataState<DeleteRegistrationModel>> call({int? params}) async {
    return await _networkRepo.deleteRegistration(params!);
  }
}
