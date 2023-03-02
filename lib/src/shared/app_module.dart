import 'package:bid365/src/autentication/login_page.dart';
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
        AutoBind.singleton(AppStore.new) 
      ];

  @override
  List<ModularRoute> get routes => [
        
        ModuleRoute('/home', module: HomeModule()),
        ChildRoute('/config', child: (context, args) => const ConfigPage())
      ];
}
