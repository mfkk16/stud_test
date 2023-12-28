import 'package:flutter/material.dart';
import 'package:stud_test/Domain/Config/routes_constants.dart';
import 'package:stud_test/Precentation/Pages/landing_page.dart';
import 'package:stud_test/Precentation/Widgets/undefined_view.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case landingPage:
      return MaterialPageRoute(builder: (context) => const LandingPage());
    default:
      return MaterialPageRoute(builder: (context) => UndefinedView(settings.name!));
  }
}
