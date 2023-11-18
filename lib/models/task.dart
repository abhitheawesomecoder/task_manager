class Task {
  String id;
  String title;
  bool status;
  String? details;

  Task(
      {required this.id,
      required this.title,
      required this.status,
      this.details});
}
