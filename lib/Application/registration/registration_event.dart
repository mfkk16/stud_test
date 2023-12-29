part of 'registration_bloc.dart';

@immutable
abstract class RegistrationEvent {}

class FetchData extends RegistrationEvent {}

class SubjectToClassroomEvent extends RegistrationEvent {
  final Classroom classroomSC;
  final Subject subjectSC;

  SubjectToClassroomEvent({required this.classroomSC, required this.subjectSC});
}
