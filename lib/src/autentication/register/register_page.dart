import 'package:bid365/src/autentication/register/register_api.dart';
import 'package:bid365/src/autentication/register/widgets/alertPassword.dart';
import 'package:flutter/material.dart';

import '../login/widgets/alert.dart';
part 'widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset('assets/icone.png'),
            const SizedBox(
              height: 50,
            ),
            Column(),
            _RegisterForm()
          ],
        ),
      )),
    );
  }
}
