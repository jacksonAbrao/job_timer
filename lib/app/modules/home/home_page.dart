import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/modules/home/widgets/project_tile.dart';

import '../../view_modules/project_model.dart';
import 'controller/home_controller.dart';
import 'widgets/header_projects_menu.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  const HomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeController, HomeState>(
      bloc: controller,
      listener: (context, state) {
        if (state.status == HomeStatus.failure) {
          AsukaSnackbar.alert('Erro ao buscar os projetos').show();
        }
      },
      child: Scaffold(
        drawer: Drawer(
          child: SafeArea(
              child: ListTile(
            title: const Text('Logout'),
            trailing: const Icon(Icons.exit_to_app),
            onTap: () => controller.logouth(),
          )),
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                title: Text('Projetos'),
                expandedHeight: 100,
                toolbarHeight: 100,
                centerTitle: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(15),
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: HeaderProjectsMenu(controller: controller),
                pinned: true,
              ),
              BlocSelector<HomeController, HomeState, bool>(
                bloc: controller,
                selector: (state) => state.status == HomeStatus.loading,
                builder: (context, showLoading) {
                  return SliverVisibility(
                    visible: showLoading,
                    sliver: const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 50,
                        child:
                            Center(child: CircularProgressIndicator.adaptive()),
                      ),
                    ),
                  );
                },
              ),
              BlocSelector<HomeController, HomeState, List<ProjectModel>>(
                bloc: controller,
                selector: (state) => state.projects,
                builder: (context, projects) {
                  return SliverList(
                    delegate: SliverChildListDelegate(
                      projects
                          .map(
                            (project) => ProjectTile(projectModel: project),
                          )
                          .toList(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
