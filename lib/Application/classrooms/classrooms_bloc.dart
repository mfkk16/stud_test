import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'classrooms_event.dart';

part 'classrooms_state.dart';

class ClassroomsBloc extends Bloc<ClassroomsEvent, ClassroomsState> {
  ClassroomsBloc() : super(ClassroomsInitial()) {}
}
