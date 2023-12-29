import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stud_test/Application/registration/registration_bloc.dart';
import 'package:stud_test/Precentation/Widgets/app_bar.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarCustom(title: "Registrations"),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        if (state is LoadedRegistrationState) {
          return ListView.builder(
            itemCount: state.list.length,
            padding: const EdgeInsets.all(15),
            itemBuilder: (context, index) {
              return InkWell(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("Text"),
                  ),
                ),
              );
            },
          );
        } else if (state is LoadingRegistrationState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(
            child: Text("Something wrong"),
          );
        }
      },
    );
  }

}
