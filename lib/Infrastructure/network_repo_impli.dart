import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:stud_test/Domain/Const/app_const.dart';
import 'package:stud_test/Domain/Core/resource/data_exception.dart';
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
import 'package:stud_test/Infrastructure/network_repo.dart';

class NetworkRepoImpli implements NetworkRepo {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: AppConst.baseUrl),
  );

  final CancelToken _cancelToken = CancelToken();

  @override
  Future<DataState<StudentsModel>> getAllStudents() async {
    try {
      Response<dynamic> response = await _dio.get("${AppConst.allStudents}/?api_key=${AppConst.apiKey}", cancelToken: _cancelToken);
      if (response.statusCode == 200) {
        String data0 = json.encode(response.data);
        StudentsModel data = studentsModelFromJson(data0);
        return DataSuccess(data);
      } else {
        return DataFailed(DataError('Failed to fetch students. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      return DataFailed(DataError(e.toString()));
    }
  }

  @override
  Future<DataState<SubjectsModel>> getSubjects() async {
    try {
      Response<dynamic> response = await _dio.get("${AppConst.allSubjects}/?api_key=${AppConst.apiKey}", cancelToken: _cancelToken);
      if (response.statusCode == 200) {
        String data0 = json.encode(response.data);
        SubjectsModel data = subjectsModelFromJson(data0);
        return DataSuccess(data);
      } else {
        return DataFailed(DataError('Failed to fetch students. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      return DataFailed(DataError(e.toString()));
    }
  }

  @override
  Future<DataState<ClassroomsModel>> getClassrooms() async {
    try {
      Response<dynamic> response = await _dio.get("${AppConst.allClassrooms}/?api_key=${AppConst.apiKey}", cancelToken: _cancelToken);
      if (response.statusCode == 200) {
        String data0 = json.encode(response.data);
        ClassroomsModel data = classroomsModelFromJson(data0);
        return DataSuccess(data);
      } else {
        return DataFailed(DataError('Failed to fetch students. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      return DataFailed(DataError(e.toString()));
    }
  }

  @override
  Future<DataState<RegistrationModel>> getRegistration() async {
    try {
      Response<dynamic> response = await _dio.get("${AppConst.allRegistrations}/?api_key=${AppConst.apiKey}", cancelToken: _cancelToken);
      if (response.statusCode == 200) {
        String data0 = json.encode(response.data);
        RegistrationModel data = registrationModelFromJson(data0);
        return DataSuccess(data);
      } else {
        return DataFailed(DataError('Failed to fetch students. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      return DataFailed(DataError(e.toString()));
    }
  }

  @override
  Future<DataState<SubjectToClassroomModel>> setSubjectToClassrooms(ParamsSubClass params) async {
    try {
      Response<dynamic> response = await _dio.patch(
        "${AppConst.allClassrooms}/${params.classId}?api_key=${AppConst.apiKey}",
        data: {"subject": params.subId},
        options: Options(headers: {"Content-Type": "application/x-www-form-urlencoded"}),
        cancelToken: _cancelToken,
      );

      if (response.statusCode == 200) {
        String data0 = json.encode(response.data);
        SubjectToClassroomModel data = subjectToClassroomModelFromJson(data0);
        return DataSuccess(data);
      } else {
        return DataFailed(DataError('Failed to fetch students. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      return DataFailed(DataError(e.toString()));
    }
  }

  @override
  Future<DataState<AssignStudentToClassroomModel>> setStudentToClassroom(ParamsStuClass params) async {
    try {
      Response<dynamic> response = await _dio.patch(
        "${AppConst.allRegistrations}/?api_key=${AppConst.apiKey}",
        data: {
          "student": params.studId,
          "subject": params.classId,
        },
        options: Options(headers: {"Content-Type": "application/x-www-form-urlencoded"}),
        cancelToken: _cancelToken,
      );
      if (response.statusCode == 200) {
        String data0 = json.encode(response.data);
        AssignStudentToClassroomModel data = assignStudentToClassroomModelFromJson(data0);
        return DataSuccess(data);
      } else {
        return DataFailed(DataError('Failed to fetch students. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      return DataFailed(DataError(e.toString()));
    }
  }

  @override
  Future<DataState<DeleteRegistrationModel>> deleteRegistration(int params) async {
    try {
      Response<dynamic> response = await _dio.delete(
        "${AppConst.allRegistrations}/$params?api_key=${AppConst.apiKey}",
        options: Options(headers: {"Content-Type": "application/x-www-form-urlencoded"}),
        cancelToken: _cancelToken,
      );
      if (response.statusCode == 200) {
        String data0 = json.encode(response.data);
        DeleteRegistrationModel data = deleteRegistrationModelFromJson(data0);
        return DataSuccess(data);
      } else {
        return DataFailed(DataError('Failed to fetch students. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      return DataFailed(DataError(e.toString()));
    }
  }
}
