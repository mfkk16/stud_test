import 'package:stud_test/Domain/Core/resource/data_state.dart';
import 'package:stud_test/Domain/Core/usecase.dart';
import 'package:stud_test/Domain/Models/classroom_model.dart';
import 'package:stud_test/Domain/Models/registration_model.dart';
import 'package:stud_test/Domain/Models/students_model.dart';
import 'package:stud_test/Domain/Models/subjects_model.dart';
import 'package:stud_test/Infrastructure/network_repo.dart';

class GetRegistrationUsecase implements Usecase<DataState<RegistrationModel>, void> {
  final NetworkRepo _networkRepo;

  GetRegistrationUsecase(this._networkRepo);

  @override
  Future<DataState<RegistrationModel>> call({void params}) async {
    return await _networkRepo.getRegistration();
  }
}
