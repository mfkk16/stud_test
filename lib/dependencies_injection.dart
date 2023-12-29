import 'package:get_it/get_it.dart';
import 'package:stud_test/Application/classrooms/classrooms_bloc.dart';
import 'package:stud_test/Application/registration/registration_bloc.dart';
import 'package:stud_test/Application/students/students_bloc.dart';
import 'package:stud_test/Application/subjects/subjects_bloc.dart';
import 'package:stud_test/Domain/Usecase/get_classrooms_usecase.dart';
import 'package:stud_test/Domain/Usecase/get_registration_usecase.dart';
import 'package:stud_test/Domain/Usecase/get_students_usecase.dart';
import 'package:stud_test/Domain/Usecase/get_subjects_usecase.dart';
import 'package:stud_test/Infrastructure/network_repo.dart';
import 'package:stud_test/Infrastructure/network_repo_impli.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<NetworkRepo>(NetworkRepoImpli());

  sl.registerSingleton<GetAllStudentsUsecase>(GetAllStudentsUsecase(sl()));
  sl.registerSingleton<GetSubjectsUsecase>(GetSubjectsUsecase(sl()));
  sl.registerSingleton<GetClassroomsUsecase>(GetClassroomsUsecase(sl()));
  sl.registerSingleton<GetRegistrationUsecase>(GetRegistrationUsecase(sl()));

  sl.registerLazySingleton<StudentsBloc>(() => StudentsBloc(sl()));
  sl.registerLazySingleton<SubjectsBloc>(() => SubjectsBloc(sl()));
  sl.registerLazySingleton<ClassroomsBloc>(() => ClassroomsBloc(sl()));
  sl.registerLazySingleton<RegistrationBloc>(() => RegistrationBloc());
}
