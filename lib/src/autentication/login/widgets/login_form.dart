part of '../login_page.dart';

class _LoginForm extends StatefulWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey)),
            child: TextFormField(
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.top,
              style: const TextStyle(fontSize: 18),
              decoration: InputDecoration(
                filled: true,
                border: InputBorder.none,
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.black),
                prefixIcon: Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.email_outlined,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey)),
            child: TextFormField(
              style: const TextStyle(fontSize: 18),
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Senha',
                filled: true,
                labelStyle: TextStyle(color: Colors.black),
                prefixIcon: Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.key_rounded,
                    color: Colors.blue,
                  ),
                ),
              ),
              obscureText: true,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('./home');
            },
            child: Text('Entrar'),
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 2, 67, 121),
                fixedSize: Size(300, 50)),
          )
        ],
      ),
    );
  }
}
