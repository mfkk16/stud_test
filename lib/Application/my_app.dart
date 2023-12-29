import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stud_test/Application/classrooms/classrooms_bloc.dart';
import 'package:stud_test/Application/registration/registration_bloc.dart';
import 'package:stud_test/Application/students/students_bloc.dart';
import 'package:stud_test/Application/subjects/subjects_bloc.dart';
import 'package:stud_test/Domain/Config/routes_constants.dart';
import 'package:stud_test/dependencies_injection.dart';
import 'package:stud_test/domain/config/routes.dart' as routes;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StudentsBloc>(create: (context) => sl()..add(FetchAllStudents())),
        BlocProvider<SubjectsBloc>(create: (context) => sl()..add(FetchSubjects())),
        BlocProvider<ClassroomsBloc>(create: (context) => sl()..add(FetchClassrooms())),
        BlocProvider<RegistrationBloc>(create: (context) => sl()..add(FetchRegistration())),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: routes.generateRoutes,
        initialRoute: landingPage,
      ),
    );
  }
}
