part of '../register_page.dart';

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({Key? key}) : super(key: key);

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final _tName = TextEditingController();
  final _tPhone = TextEditingController();
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();
  final _tConfirmaSenha = TextEditingController();

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
                controller: _tName,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.top,
                style: const TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  labelText: 'Nome de usuário',
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.person_add_alt_1,
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
                controller: _tPhone,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.top,
                style: const TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  labelText: 'Telefone',
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.phone,
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
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.top,
                style: const TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  labelText: 'Senha',
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
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey)),
              child: TextFormField(
                controller: _tConfirmaSenha,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.top,
                style: const TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  labelText: 'Confirme a senha',
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
                if (_tSenha.text == _tConfirmaSenha.text) {
                  // Navigator.of(context)
                  //     .pop('./login'); //Acertar para voltar uma tela
                  _onClickRegister(context);
                } else {
                  alertPassword(context, "As senhas não coincidem");
                }
              },
              child: Text('Cadastrar'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 2, 67, 121),
                  fixedSize: Size(300, 50)),
            )
          ],
        ));
  }

  _onClickRegister(BuildContext context) async {
    final login = _tLogin.text;
    final senha = _tSenha.text;
    final name = _tName.text;
    final phone = _tPhone.text;
    print('Login: $login, Senha: $senha');
    if (!_formKey.currentState!.validate()) {
      return;
    }
    var response = await RegisteApi.register(
      login,
      senha,
      name,
      phone,
    );
    if (response == true) {
      Navigator.of(context).pushNamed('/login/home');
      alert(context, 'Usuário cadastrado com sucesso!');
    } else {
      alert(context, "Login ja cadastrado, por favor tente novamente");
    }
  }
}
