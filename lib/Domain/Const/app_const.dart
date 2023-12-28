class AppConst {
  const AppConst._();

  static const String _baseUrl = "https://nibrahim.pythonanywhere.com";
  static const String _apiKey = "a4AAE";

  static const String allStudents = "$_baseUrl/students/?api_key=$_apiKey";
  static const String allSubjects = "$_baseUrl/subjects/?api_key=$_apiKey";
  static const String allClassrooms = "$_baseUrl/classrooms/?api_key=$_apiKey";
}
