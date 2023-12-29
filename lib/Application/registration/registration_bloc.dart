import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stud_test/Application/classrooms/classrooms_bloc.dart';
import 'package:stud_test/Application/students/students_bloc.dart';
import 'package:stud_test/Application/subjects/subjects_bloc.dart';
import 'package:stud_test/Domain/Models/classroom_model.dart';
import 'package:stud_test/Domain/Models/students_model.dart';
import 'package:stud_test/Domain/Models/subjects_model.dart';
import 'package:stud_test/dependencies_injection.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial()) {
    on<FetchData>(fetchData);
    on<SubjectToClassroomEvent>(subjectToClassroomEvent);
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

  FutureOr<void> subjectToClassroomEvent(SubjectToClassroomEvent event, Emitter<RegistrationState> emit) {

  }
}
