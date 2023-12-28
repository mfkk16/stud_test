import 'package:get_it/get_it.dart';
import 'package:stud_test/Infrastructure/network_repo.dart';
import 'package:stud_test/Infrastructure/network_repo_impli.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<NetworkRepo>(NetworkRepoImpli());



}
