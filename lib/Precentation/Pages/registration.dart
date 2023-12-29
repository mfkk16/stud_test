import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stud_test/Application/registration/registration_bloc.dart';
import 'package:stud_test/Domain/Models/classroom_model.dart';
import 'package:stud_test/Domain/Models/subjects_model.dart';
import 'package:stud_test/Precentation/Widgets/app_bar.dart';
import 'package:stud_test/dependencies_injection.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  var registerBloc = sl<RegistrationBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarCustom(title: "Registrations"),
      body: _body(context),
    );
  }

  String scClassroomHint = "Select a Classroom";
  String scSubjectHint = "Select a Subject";
  late Subject subjectSC;
  late Classroom classroomSC;

  Widget _body(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        if (state is LoadingRegistrationState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Assign Subject To Classroom", style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    const Text("Classroom Name"),
                    DropdownButton<String>(
                      isExpanded: true,
                      hint: Text(scClassroomHint),
                      items: registerBloc.listClassroom.map((Classroom value) {
                        return DropdownMenuItem<String>(
                          value: value.id.toString(),
                          child: Text(value.name),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        classroomSC = registerBloc.listClassroom.firstWhere((student) => student.id == int.parse(value!));
                        scClassroomHint = classroomSC.name;
                        setState(() {});
                      },
                    ),
                    const SizedBox(height: 30),
                    const Text("Subject Name"),
                    DropdownButton<String>(
                      isExpanded: true,
                      hint: Text(scSubjectHint),
                      items: registerBloc.listSubject.map((Subject value) {
                        return DropdownMenuItem<String>(
                          value: value.id.toString(),
                          child: Text(value.name),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        subjectSC = registerBloc.listSubject.firstWhere((student) => student.id == int.parse(value!));
                        scSubjectHint = subjectSC.name;
                        setState(() {});
                      },
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () {
                          registerBloc.add(
                            SubjectToClassroomEvent(
                              classroomSC: classroomSC,
                              subjectSC: subjectSC,
                            ),
                          );
                        },
                        child: const Text("Assign")),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
