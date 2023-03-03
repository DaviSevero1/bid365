import 'package:bid365/src/autentication/login/login_page.dart';
import 'package:bid365/src/autentication/register/register_module.dart';
import 'package:bid365/src/autentication/register/register_page.dart';
import 'package:bid365/src/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {

   @override
   final List<Bind> binds = [];

   @override
   final List<ModularRoute> routes = [
    ChildRoute('/register', child: (context, args) => const RegisterPage()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/register', module: RegisterModule())
   ];

}