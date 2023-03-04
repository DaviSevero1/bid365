part of '../register_page.dart';

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({Key? key}) : super(key: key);

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
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
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.top,
            style: const TextStyle(fontSize: 18),
            decoration: InputDecoration(
              filled: true,
              border: InputBorder.none,
              labelText: 'senha',
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
            Navigator.of(context).pop('./login'); //Acertar para voltar uma tela
          },
          child: Text('Cadastrar'),
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 2, 67, 121),
              fixedSize: Size(300, 50)),
        )
      ],
    ));
  }
}
