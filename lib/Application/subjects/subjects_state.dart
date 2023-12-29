part of 'subjects_bloc.dart';

@immutable
abstract class SubjectsState {}

class SubjectsInitial extends SubjectsState {}

class LoadedSubjectsState extends SubjectsState {
  final List<Subject> list;

  LoadedSubjectsState({required this.list});
}

class LoadingSubjectsState extends SubjectsState {}