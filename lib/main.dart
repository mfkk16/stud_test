import 'package:flutter/material.dart';
import 'package:stud_test/Application/my_app.dart';
import 'package:stud_test/dependencies_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}
