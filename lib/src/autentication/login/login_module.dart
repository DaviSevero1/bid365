import 'package:bid365/src/autentication/login/login_page.dart';
import 'package:bid365/src/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../register/register_module.dart';

class LoginModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
        ModuleRoute('/', module: RegisterModule()),
        ChildRoute('/', child: (context, args) => const LoginPage()),
        //ChildRoute('/home', child: (context, args) => const HomePage()),
        //ChildRoute('/edit', child: (context, args) => const EditTaskBoardPage())
      ];
}
