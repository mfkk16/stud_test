import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stud_test/Application/classrooms/classrooms_bloc.dart';
import 'package:stud_test/Domain/Models/classroom_model.dart';
import 'package:stud_test/Precentation/Widgets/app_bar.dart';
import 'package:stud_test/Precentation/Widgets/subtitle_widget.dart';

class ClassroomsPage extends StatelessWidget {
  const ClassroomsPage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarCustom(title: "Class Rooms"),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return BlocBuilder<ClassroomsBloc, ClassroomsState>(
      builder: (context, state) {
        if (state is LoadedStudentState) {
          return ListView.builder(
            itemCount: state.list.length,
            padding: const EdgeInsets.all(15),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => showAlertBox(context, state.list[index]),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(state.list[index].name),
                  ),
                ),
              );
            },
          );
        } else if (state is LoadingStudentState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(
            child: Text("Something wrong"),
          );
        }
      },
    );
  }

  showAlertBox(BuildContext context, Classroom classroom) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          insetPadding: const EdgeInsets.all(0),
          backgroundColor: Colors.white,
          content: Container(
            width: 300,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(classroom.name),

                const SizedBox(height: 15),
                Row(
                  children: [
                    SubtitleWidget(title: "ID", body: classroom.id.toString()),
                    const Spacer(),
                    SubtitleWidget(title: "Layout", body: classroom.layout),     const Spacer(),
                    SubtitleWidget(title: "Size", body: classroom.size.toString()),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
