import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:stud_test/Domain/Const/app_const.dart';
import 'package:stud_test/Domain/Core/resource/data_exception.dart';
import 'package:stud_test/Domain/Core/resource/data_state.dart';
import 'package:stud_test/Domain/Models/classroom_model.dart';
import 'package:stud_test/Domain/Models/students_model.dart';
import 'package:stud_test/Domain/Models/subjects_model.dart';
import 'package:stud_test/Infrastructure/network_repo.dart';

class NetworkRepoImpli implements NetworkRepo {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: AppConst.baseUrl),
  );

  final CancelToken _cancelToken = CancelToken();

  @override
  Future<DataState<StudentsModel>> getAllStudents() async {
    try {
      Response<dynamic> response = await _dio.get(AppConst.allStudents, cancelToken: _cancelToken);
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
      Response<dynamic> response = await _dio.get(AppConst.allSubjects, cancelToken: _cancelToken);
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
      Response<dynamic> response = await _dio.get(AppConst.allClassrooms, cancelToken: _cancelToken);
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
}
