import 'package:bloc/bloc.dart';

import '../../../../view_modules/project_model.dart';

part 'task_controller.dart';

enum TaskStatus {
  initial,
  loading,
  success,
  failure,
}
