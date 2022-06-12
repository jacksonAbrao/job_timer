part of 'task_state.dart';

class TaskController extends Cubit<TaskStatus> {
  late final ProjectModel _projectModel;

  TaskController() : super(TaskStatus.initial);

  void setProject(ProjectModel projectModel) => _projectModel = projectModel;
}
