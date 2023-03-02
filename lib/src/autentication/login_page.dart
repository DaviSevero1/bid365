import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Login',
            ),
            const SizedBox(
              height: 33,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'E-mail',
                fillColor: Color.fromARGB(255, 149, 149, 149),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                fillColor: Color.fromARGB(255, 149, 149, 149),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Esqueceu a senha?',
                  style: TextStyle(color: Color.fromARGB(255, 159, 12, 2)),
                ),
                const SizedBox(
                  width: 150,
                ),
                Text(
                  'Cadastre-se',
                  style: const TextStyle(color: Colors.blue),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
