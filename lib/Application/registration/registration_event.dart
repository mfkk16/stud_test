part of 'registration_bloc.dart';

@immutable
abstract class RegistrationEvent {}

class FetchData extends RegistrationEvent {}

class FetchAllRegistrations extends RegistrationEvent {}

class DeleteRegistration extends RegistrationEvent {
  final int regId;

  DeleteRegistration({required this.regId});
}

class SubjectToClassroomEvent extends RegistrationEvent {
  final Classroom classroomSC;
  final Subject subjectSC;

  SubjectToClassroomEvent({required this.classroomSC, required this.subjectSC});
}

class StudentToClassroomEvent extends RegistrationEvent {
  final Classroom classroom;
  final Student student;

  StudentToClassroomEvent({required this.classroom, required this.student});
}
