import 'package:flutter/material.dart';
import 'package:stud_test/Precentation/Pages/classrooms.dart';
import 'package:stud_test/Precentation/Pages/registration.dart';
import 'package:stud_test/Precentation/Pages/students.dart';
import 'package:stud_test/Precentation/Pages/subjects.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return const DefaultTabController(
      length: 4,
      child: Column(
        children: [
          Expanded(
            child: TabBarView(
              children: [
                Students(),
                Subjects(),
                Classrooms(),
                Registration(),
              ],
            ),
          ),
          TabBar(
            tabs: [
              Tab(icon: Icon(Icons.person), text: "Students"),
              Tab(icon: Icon(Icons.subject), text: "Subjects"),
              Tab(icon: Icon(Icons.class_), text: "Classrooms"),
              Tab(icon: Icon(Icons.app_registration), text: "Registration"),
            ],
          ),
        ],
      ),
    );
  }
}
