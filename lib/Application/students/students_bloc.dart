import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stud_test/Domain/Core/resource/data_state.dart';
import 'package:stud_test/Domain/Models/students_model.dart';
import 'package:stud_test/Domain/Usecase/get_students_usecase.dart';
import 'package:stud_test/Precentation/Widgets/toast_util.dart';

part 'students_event.dart';

part 'students_state.dart';

class StudentsBloc extends Bloc<StudentsEvent, StudentsState> {
  final GetAllStudentsUsecase _getAllStudentsUsecase;

  StudentsBloc(this._getAllStudentsUsecase) : super(StudentsInitial()) {
    on<FetchAllStudents>(fetchStudents);
  }

  FutureOr<void> fetchStudents(FetchAllStudents event, Emitter<StudentsState> emit) async {
    emit(LoadingStudentState());
    var data = await _getAllStudentsUsecase();
    if (data is DataSuccess) {
      ToastUtil.showToast("Successfully fetched the students");
      emit(LoadedStudentState(list: data.data!.students));
    } else {
      ToastUtil.showToast(data.dataError!.errorMessage);
    }
  }
}
