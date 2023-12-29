import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stud_test/Domain/Core/resource/data_state.dart';
import 'package:stud_test/Domain/Models/subjects_model.dart';
import 'package:stud_test/Domain/Usecase/get_subjects_usecase.dart';
import 'package:stud_test/Precentation/Widgets/toast_util.dart';

part 'subjects_event.dart';

part 'subjects_state.dart';

class SubjectsBloc extends Bloc<SubjectsEvent, SubjectsState> {
  final GetSubjectsUsecase _getSubjectsUsecase;

  SubjectsBloc(this._getSubjectsUsecase) : super(SubjectsInitial()) {
    on<FetchSubjects>(fetchSubjects);
  }

  FutureOr<void> fetchSubjects(FetchSubjects event, Emitter<SubjectsState> emit) async {
    emit(LoadingSubjectsState());
    var data = await _getSubjectsUsecase();
    if (data is DataSuccess) {
      ToastUtil.showToast("Successfully fetched the subjects");
      emit(LoadedSubjectsState(list: data.data!.subjects));
    } else {
      ToastUtil.showToast(data.dataError!.errorMessage);
    }
  }
}
