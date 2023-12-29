class AppConst {
  const AppConst._();

  static const String baseUrl = "https://nibrahim.pythonanywhere.com";
  static const String _apiKey = "a4AAE";

  static const String allStudents = "/students/?api_key=$_apiKey";
  static const String allSubjects = "/subjects/?api_key=$_apiKey";
  static const String allClassrooms = "/classrooms/?api_key=$_apiKey";
  static const String allRegistrations = "/registration/?api_key=$_apiKey";
}
