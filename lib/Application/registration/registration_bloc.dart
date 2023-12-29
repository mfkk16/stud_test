import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stud_test/Application/classrooms/classrooms_bloc.dart';
import 'package:stud_test/Application/students/students_bloc.dart';
import 'package:stud_test/Application/subjects/subjects_bloc.dart';
import 'package:stud_test/Domain/Core/resource/data_state.dart';
import 'package:stud_test/Domain/Models/classroom_model.dart';
import 'package:stud_test/Domain/Models/registration_model.dart';
import 'package:stud_test/Domain/Models/students_model.dart';
import 'package:stud_test/Domain/Models/subjects_model.dart';
import 'package:stud_test/Domain/Usecase/get_registration_usecase.dart';
import 'package:stud_test/Domain/Usecase/removeStudentFromCls_usecase.dart';
import 'package:stud_test/Domain/Usecase/student_classroom_usecase.dart';
import 'package:stud_test/Domain/Usecase/subject_classroom_usecase.dart';
import 'package:stud_test/Precentation/Widgets/toast_util.dart';
import 'package:stud_test/dependencies_injection.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final SetSubjectToClassroom _setSubjectToClassroom;
  final SetStudentToClassroom _setStudentToClassroom;
  final DeleteStudentToClassroom _deleteStudentToClassroom;
  final GetRegistrationUsecase _getRegistrationUsecase;

  RegistrationBloc(
    this._setSubjectToClassroom,
    this._setStudentToClassroom,
    this._deleteStudentToClassroom,
    this._getRegistrationUsecase,
  ) : super(RegistrationInitial()) {
    on<FetchData>(fetchData);
    on<SubjectToClassroomEvent>(subjectToClassroomEvent);
    on<StudentToClassroomEvent>(studentToClassroomEvent);
//
    on<FetchAllRegistrations>(fetchAllRegistrations);
    on<DeleteRegistration>(deleteRegistration);
  }

  final _classroomBlock = sl<ClassroomsBloc>();
  final _studentBlock = sl<StudentsBloc>();
  final _subjectBlock = sl<SubjectsBloc>();

  List<Classroom> listClassroom = [];
  List<Student> listStudents = [];
  List<Subject> listSubject = [];

  FutureOr<void> fetchData(FetchData event, Emitter<RegistrationState> emit) async {
    emit(LoadingRegistrationState());
    listClassroom = await _classroomBlock.getClassroom;
    listStudents = await _studentBlock.getStudents;
    listSubject = await _subjectBlock.getSubjects;
    emit(LoadedRegistrationState());
  }

  FutureOr<void> subjectToClassroomEvent(SubjectToClassroomEvent event, Emitter<RegistrationState> emit) async {
    var data = await _setSubjectToClassroom(
      params: ParamsSubClass(
        classId: event.classroomSC.id,
        subId: event.subjectSC.id,
      ),
    );
    if (data is DataSuccess) {
      ToastUtil.showToast("Successfully Assigned");
      emit(AssignSuccessState());
    } else {
      ToastUtil.showToast(data.dataError!.errorMessage);
    }
  }

  FutureOr<void> studentToClassroomEvent(StudentToClassroomEvent event, Emitter<RegistrationState> emit) async {
    var data = await _setStudentToClassroom(
      params: ParamsStuClass(
        classId: event.classroom.id,
        studId: event.student.id,
      ),
    );
    if (data is DataSuccess) {
      ToastUtil.showToast("Successfully Assigned");
      emit(AssignSuccessState());
    } else {
      ToastUtil.showToast(data.dataError!.errorMessage);
    }
  }

  FutureOr<void> fetchAllRegistrations(FetchAllRegistrations event, Emitter<RegistrationState> emit)async {
    emit(LoadingRegistrationState());
    var data = await _getRegistrationUsecase();
    if (data is DataSuccess) {
      emit(LoadedAllRegistrations(list: data.data!.registrations));
    } else {
      ToastUtil.showToast(data.dataError!.errorMessage);
    }
  }

  FutureOr<void> deleteRegistration(DeleteRegistration event, Emitter<RegistrationState> emit)async {
    var data = await _deleteStudentToClassroom(params: event.regId);
    if (data is DataSuccess) {
      ToastUtil.showToast("Successfully Deleted");
      emit(AssignSuccessState());
    } else {
      ToastUtil.showToast(data.dataError!.errorMessage);
    }
  }
}
