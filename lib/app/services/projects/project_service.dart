import 'package:job_timer/app/view_modules/project_model.dart';

abstract class ProjectService {
  Future<void> register(ProjectModel projectModel);
}
