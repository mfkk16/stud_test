part of 'registration_bloc.dart';

@immutable
abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class LoadedAllRegistrations extends RegistrationState {
  final List<Registration> list;

  LoadedAllRegistrations({required this.list});
}

class LoadingRegistrationState extends RegistrationState {}

class AssignSuccessState extends RegistrationState {}

class LoadedRegistrationState extends RegistrationState {}
