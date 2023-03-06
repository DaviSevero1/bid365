import 'package:bid365/src/autentication/login/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../autentication/register/register_module.dart';
import 'edit_task_board_page.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/home', child: (context, args) => const HomePage()),
        ChildRoute('/edit', child: (context, args) => const EditTaskBoardPage())
      ];
}
