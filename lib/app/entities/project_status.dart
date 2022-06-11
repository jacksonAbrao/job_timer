enum ProjectStatus {
  emAndamento(label: 'Em andamento'),
  finalizado(label: 'Finalizados');

  final String label;
  const ProjectStatus({required this.label});
}
