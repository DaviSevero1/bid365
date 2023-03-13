import 'package:bid365/src/autentication/login/login_module.dart';
import 'package:bid365/src/home/leiloes_api/leiloes_api.dart';
import 'package:bid365/src/home/lotes_api/model_lotes.dart';
import 'package:bid365/src/home/lotes_api/lotes_api.dart';
import 'package:bid365/src/shared/services/realm/realm_config.dart';
import 'package:bid365/src/shared/stores/app_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:realm/realm.dart';

import '../configuration/config_page.dart';
import '../configuration/services/configuration_service.dart';
import '../home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.instance<Realm>(Realm(config)),
        AutoBind.factory<ConfigurationService>(ConfigurationServiceImpl.new),
        AutoBind.singleton(AppStore.new),
        Bind.instance<Leilao_api>(Leilao_api()),
        Bind.instance<Lotes_api>(Lotes_api())
      ];

  @override
  List<ModularRoute> get routes => [
        //ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/login', module: LoginModule()),
        //ChildRoute('/', child: (context, args) => const LoginPage()),
        ChildRoute('/config', child: (context, args) => const ConfigPage()),
      ];
}
