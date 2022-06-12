import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/core/ui/job_timer_icons.dart';
import 'package:job_timer/app/modules/project/detail/controller/project_detail_controller.dart';
import 'package:job_timer/app/view_modules/project_model.dart';

import 'widgets/project_detail_appbar.dart';
import 'widgets/project_pie_chart.dart';
import 'widgets/project_task_tile.dart';

class ProjectDetailPage extends StatelessWidget {
  final ProjectDetailController controller;

  const ProjectDetailPage({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProjectDetailController, ProjectDetailState>(
        bloc: controller,
        listener: ((context, state) {
          if (state.status == ProjectDetailStatus.failure) {
            AsukaSnackbar.alert('Erro interno');
          }
        }),
        builder: ((context, state) {
          final projectModel = state.projectModel;

          switch (state.status) {
            case ProjectDetailStatus.initial:
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Center(
                      child: Text('Carregando projeto'),
                    ),
                  )
                ],
              );
            case ProjectDetailStatus.loading:
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Center(
                      child: Text('Carregando projeto'),
                    ),
                  )
                ],
              );
            case ProjectDetailStatus.complete:
              return _buildProjectDetail(context, projectModel!);
            case ProjectDetailStatus.failure:
              if (projectModel != null) {
                return _buildProjectDetail(context, projectModel);
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.error),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Center(
                      child: Text('Erro ao carregar projeto'),
                    ),
                  ),
                ],
              );
          }
        }),
      ),
    );
  }

  Widget _buildProjectDetail(BuildContext contex, ProjectModel projectModel) {
    return CustomScrollView(slivers: [
      ProjectDetailAppbar(
        projectModel: projectModel,
      ),
      SliverList(
        delegate: SliverChildListDelegate([
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0),
            child: ProjectPieChart(),
          ),
          ProjectTaskTile(),
        ]),
      ),
      SliverFillRemaining(
        hasScrollBody: false,
        child: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(JobTimerIcons.ok_circled2),
              label: Text('Finalizar projeto'),
            ),
          ),
        ),
      )
    ]);
  }
}
