import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/project/register/controller/project_register_controller.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

import 'project_register_page.dart';

List<Bind<Object>> get binds => [
      BlocBind.lazySingleton(
          (i) => ProjectRegisterController(projectService: i())) // AppModule
    ];

class ProjectRegisterModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/projects/register',
          child: (context, args) => ProjectRegisterPage(
            controller: Modular.get(),
          ),
        ),
      ];
}
