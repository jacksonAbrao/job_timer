import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/view_modules/project_task_model.dart';

class ProjectModel {
  final int? id;
  final String name;
  final int estimate;
  final double price;
  final ProjectStatus status;
  final List<ProjectTaskModel> tasks;
  ProjectModel({
    this.id,
    required this.name,
    required this.estimate,
    required this.price,
    required this.status,
    required this.tasks,
  });
}
