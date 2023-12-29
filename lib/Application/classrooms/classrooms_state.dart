part of 'classrooms_bloc.dart';

@immutable
abstract class ClassroomsState {}

class ClassroomsInitial extends ClassroomsState {}

class LoadedStudentState extends ClassroomsState {
  final List<Classroom> list;

  LoadedStudentState({required this.list});
}

class LoadingStudentState extends ClassroomsState {}
