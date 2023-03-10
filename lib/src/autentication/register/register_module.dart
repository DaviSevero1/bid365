import 'package:bid365/src/autentication/register/register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterModule extends Module {

   @override
   final List<Bind> binds = [];

   @override
   final List<ModularRoute> routes = [
    ChildRoute('/register', child: (context, args) => const RegisterPage())
   ];

}