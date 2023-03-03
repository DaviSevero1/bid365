part of '../login_page.dart';

class _ButtonRegister extends StatelessWidget {
  const _ButtonRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, './register');
      },
      child: Text('Cadastre-se'),
      style: TextButton.styleFrom(
        foregroundColor: Colors.blue,
      ),
    );
  }
}
