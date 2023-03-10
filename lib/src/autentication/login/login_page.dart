import 'package:bid365/src/autentication/login/login_api.dart';
import 'package:bid365/src/autentication/login/widgets/alert.dart';
import 'package:flutter/material.dart';
part 'widgets/login_form.dart';
part 'widgets/button_register.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Image.asset('assets/icone.png'),
            SizedBox(
              height: 150,
            ),
            const _LoginForm(),
            const SizedBox(
              height: 17,
            ),
            const _OrSeparator(),
            const _ButtonRegister()
          ],
        ),
      ),
    );
  }
}

class _OrSeparator extends StatelessWidget {
  const _OrSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'OU',
            style: TextStyle(color: Color.fromARGB(255, 1, 64, 116)),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
