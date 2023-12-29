import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final GetRegistrationUsecase _getRegistrationUsecase;

  RegistrationBloc(this._getRegistrationUsecase) : super(SubjectsInitial()) {
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
