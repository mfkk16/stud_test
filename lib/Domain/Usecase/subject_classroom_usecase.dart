import 'package:stud_test/Domain/Core/resource/data_state.dart';
import 'package:stud_test/Domain/Core/usecase.dart';
import 'package:stud_test/Domain/Models/assignSubjectToClassroom.dart';
import 'package:stud_test/Infrastructure/network_repo.dart';

class SetSubjectToClassroom implements Usecase<DataState<SubjectToClassroomModel>, ParamsSubClass> {
  final NetworkRepo _networkRepo;

  SetSubjectToClassroom(this._networkRepo);

  @override
  Future<DataState<SubjectToClassroomModel>> call({ParamsSubClass? params}) async {
    return await _networkRepo.setSubjectToClassrooms(params!);
  }
}

class ParamsSubClass {
  int subId;
  int classId;

  ParamsSubClass({required this.subId, required this.classId});
}
