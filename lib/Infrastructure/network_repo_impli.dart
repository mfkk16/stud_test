import 'package:dio/dio.dart';
import 'package:stud_test/Infrastructure/network_repo.dart';

class NetworkRepoImpli implements NetworkRepo{
  Dio  _dio = Dio() ;
  CancelToken? _cancelToken;
}
