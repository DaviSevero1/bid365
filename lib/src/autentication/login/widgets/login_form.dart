part of '../login_page.dart';

class _LoginForm extends StatefulWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey)),
            child: TextFormField(
              controller: _tLogin,
              keyboardType: TextInputType.text,
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
              controller: _tSenha,
              keyboardType: TextInputType.text,
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
              _onClickLogin(context);
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

  _onClickLogin(BuildContext context) async {
    final login = _tLogin.text;
    final senha = _tSenha.text;
    print('Login: $login, Senha: $senha');
    if (!_formKey.currentState!.validate()) {
      return;
    }
    var response = await LoginApi.login(login, senha);
    if (response == true) {
      Navigator.of(context).pushNamed('/login/home');
    } else {
      alert(context, "Login ou Senha Inválida");
    }
  }
}
   

