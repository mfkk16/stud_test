import 'package:stud_test/Domain/Core/resource/data_state.dart';
import 'package:stud_test/Domain/Core/usecase.dart';
import 'package:stud_test/Domain/Models/assignStudentToClassroom.dart';
import 'package:stud_test/Infrastructure/network_repo.dart';

class SetStudentToClassroom implements Usecase<DataState<AssignStudentToClassroomModel>, ParamsStuClass> {
  final NetworkRepo _networkRepo;

  SetStudentToClassroom(this._networkRepo);

  @override
  Future<DataState<AssignStudentToClassroomModel>> call({ParamsStuClass? params}) async {
    return await _networkRepo.setStudentToClassroom(params!);
  }
}

class ParamsStuClass {
  int studId;
  int classId;

  ParamsStuClass({required this.studId, required this.classId});
}
