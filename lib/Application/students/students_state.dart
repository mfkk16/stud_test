part of 'students_bloc.dart';

@immutable
abstract class StudentsState {}

class StudentsInitial extends StudentsState {}

class LoadedStudentState extends StudentsState {
  final List<Student> list;

  LoadedStudentState({required this.list});
}

class LoadingStudentState extends StudentsState {}
