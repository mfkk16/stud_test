import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stud_test/Domain/Core/resource/data_state.dart';
import 'package:stud_test/Domain/Models/classroom_model.dart';
import 'package:stud_test/Domain/Usecase/get_classrooms_usecase.dart';
import 'package:stud_test/Precentation/Widgets/toast_util.dart';

part 'classrooms_event.dart';

part 'classrooms_state.dart';

class ClassroomsBloc extends Bloc<ClassroomsEvent, ClassroomsState> {
  final GetClassroomsUsecase _getClassroomsUsecase;

  ClassroomsBloc(this._getClassroomsUsecase) : super(ClassroomsInitial()) {
    on<FetchClassrooms>(fetchClassrooms);
  }

  FutureOr<void> fetchClassrooms(FetchClassrooms event, Emitter<ClassroomsState> emit) async {
    emit(LoadingStudentState());
    var data = await _getClassroomsUsecase();
    if (data is DataSuccess) {
      ToastUtil.showToast("Successfully fetched the students");
      emit(LoadedStudentState(list: data.data!.classrooms));
    } else {
      ToastUtil.showToast(data.dataError!.errorMessage);
    }
  }
}
