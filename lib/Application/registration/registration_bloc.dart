import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stud_test/Domain/Core/resource/data_state.dart';
import 'package:stud_test/Domain/Models/registration_model.dart';
import 'package:stud_test/Domain/Usecase/get_registration_usecase.dart';
import 'package:stud_test/Precentation/Widgets/toast_util.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final GetRegistrationUsecase _getRegistrationUsecase;
  List<Registration> _list = [];

  RegistrationBloc(this._getRegistrationUsecase) : super(RegistrationInitial()) {
    on<FetchRegistration>(fetchSubjects);
  }

  FutureOr<void> fetchSubjects(FetchRegistration event, Emitter<RegistrationState> emit) async {
    emit(LoadingRegistrationState());
    var data = await _getRegistrationUsecase();
    if (data is DataSuccess) {
      emit(LoadedRegistrationState(list: data.data!.registrations));
    } else {
      ToastUtil.showToast(data.dataError!.errorMessage);
    }
  }
}
