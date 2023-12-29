part of 'registration_bloc.dart';

@immutable
abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}
class LoadedRegistrationState extends RegistrationState {
  final List<Subject> list;

  LoadedRegistrationState({required this.list});
}

class LoadingRegistrationState extends RegistrationState {}