import 'package:get_it/get_it.dart';
import 'package:stud_test/Application/students/students_bloc.dart';
import 'package:stud_test/Domain/Usecase/get_students_usecase.dart';
import 'package:stud_test/Infrastructure/network_repo.dart';
import 'package:stud_test/Infrastructure/network_repo_impli.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<NetworkRepo>(NetworkRepoImpli());

  sl.registerSingleton<GetAllStudentsUsecase>(GetAllStudentsUsecase(sl()));

  sl.registerLazySingleton<StudentsBloc>(() => StudentsBloc(sl()));
}
