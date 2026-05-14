class ProjectModel {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String longDescription;
  final List<String> technologies;
  final String? githubUrl;
  final String? liveUrl;
  final bool isLive;
  final bool isFeatured;
  final bool isFyp;
  final bool isComingSoon;
  final List<String> liveCountries;
  final String category;
  final String status;
  final String iconName;
  final List<String> gradientColors;

  const ProjectModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.longDescription,
    required this.technologies,
    this.githubUrl,
    this.liveUrl,
    this.isLive = false,
    this.isFeatured = false,
    this.isFyp = false,
    this.isComingSoon = false,
    this.liveCountries = const [],
    required this.category,
    required this.status,
    required this.iconName,
    required this.gradientColors,
  });
}