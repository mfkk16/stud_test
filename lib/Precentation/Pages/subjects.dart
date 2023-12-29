import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stud_test/Application/subjects/subjects_bloc.dart';
import 'package:stud_test/Domain/Models/subjects_model.dart';
import 'package:stud_test/Precentation/Widgets/app_bar.dart';
import 'package:stud_test/Precentation/Widgets/subtitle_widget.dart';

class SubjectsPage extends StatelessWidget {
  const SubjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarCustom(title: "Subjects"),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return BlocBuilder<SubjectsBloc, SubjectsState>(
      builder: (context, state) {
        if (state is LoadedSubjectsState) {
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
        } else if (state is LoadedSubjectsState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(
            child: Text("Something wrong"),
          );
        }
      },
    );
  }

  showAlertBox(BuildContext context, Subject subject) {
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
                Text(subject.name),
                SizedBox(height: 15),
                Row(
                  children: [
                    SubtitleWidget(title: "Teacher", body: subject.teacher),
                    Spacer(),
                    SubtitleWidget(title: "Credits", body: subject.credits.toString()),
                    Spacer(),
                    SubtitleWidget(title: "ID", body: subject.id.toString()),
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
