import 'package:stud_test/Domain/Core/resource/data_state.dart';
import 'package:stud_test/Domain/Models/assignStudentToClassroom.dart';
import 'package:stud_test/Domain/Models/assignSubjectToClassroom.dart';
import 'package:stud_test/Domain/Models/classroom_model.dart';
import 'package:stud_test/Domain/Models/deleteRegistrationModel.dart';
import 'package:stud_test/Domain/Models/registration_model.dart';
import 'package:stud_test/Domain/Models/students_model.dart';
import 'package:stud_test/Domain/Models/subjects_model.dart';
import 'package:stud_test/Domain/Usecase/student_classroom_usecase.dart';
import 'package:stud_test/Domain/Usecase/subject_classroom_usecase.dart';

abstract class NetworkRepo {
  Future<DataState<StudentsModel>> getAllStudents();
  Future<DataState<SubjectsModel>> getSubjects();
  Future<DataState<ClassroomsModel>> getClassrooms();
  Future<DataState<RegistrationModel>> getRegistration();
  //
  Future<DataState<SubjectToClassroomModel>> setSubjectToClassrooms(ParamsSubClass params);
  Future<DataState<AssignStudentToClassroomModel>> setStudentToClassroom(ParamsStuClass params);
  Future<DataState<DeleteRegistrationModel>> deleteRegistration(int params);
}
