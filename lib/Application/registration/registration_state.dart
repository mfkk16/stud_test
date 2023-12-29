part of 'registration_bloc.dart';

@immutable
abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class LoadedRegistrationState extends RegistrationState {}

class LoadingRegistrationState extends RegistrationState {}
