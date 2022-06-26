class Project {
  late String student_name;
  late String project_name;
  late String? description;
  late String? image_address;
  late String? documentation_address;
  late String? github_link;
  late List<String>? tags;
  late List<String>? Categeories;
  Project(
      {required this.student_name,
      required this.project_name,
      this.description,
      this.documentation_address,
      this.image_address,
      this.github_link,
      this.tags});
}
