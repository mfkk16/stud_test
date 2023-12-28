import 'package:flutter/material.dart';
import 'package:stud_test/Domain/Config/routes_constants.dart';
import 'package:stud_test/domain/config/routes.dart' as routes;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: routes.generateRoutes,
      initialRoute: landingPage,
    );
  }
}
