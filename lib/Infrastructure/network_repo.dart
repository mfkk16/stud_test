import 'package:stud_test/Domain/Core/resource/data_state.dart';
import 'package:stud_test/Domain/Models/classroom_model.dart';
import 'package:stud_test/Domain/Models/registration_model.dart';
import 'package:stud_test/Domain/Models/students_model.dart';
import 'package:stud_test/Domain/Models/subjects_model.dart';

abstract class NetworkRepo {
  Future<DataState<StudentsModel>> getAllStudents();
  Future<DataState<SubjectsModel>> getSubjects();
  Future<DataState<ClassroomsModel>> getClassrooms();
  Future<DataState<RegistrationModel>> getRegistration();
}
