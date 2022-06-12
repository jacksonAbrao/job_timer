import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:job_timer/app/services/projects/project_service.dart';
import 'package:job_timer/app/view_modules/project_task_model.dart';

import '../../../../view_modules/project_model.dart';

part 'task_controller.dart';

enum TaskStatus {
  initial,
  loading,
  success,
  failure,
}
