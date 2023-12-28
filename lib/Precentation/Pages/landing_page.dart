import 'package:flutter/material.dart';
import 'package:stud_test/Precentation/Widgets/app_bar.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarCustom(title: "Landing PAge"),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container();
  }
}
