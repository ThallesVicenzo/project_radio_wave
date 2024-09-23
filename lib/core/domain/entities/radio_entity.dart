class RadioEntity {
  final String name;
  final String url;
  final String? image;
  final List<String>? tags;
  final String country;

  RadioEntity({
    required this.name,
    required this.url,
    required this.image,
    required this.tags,
    required this.country,
  });
}
