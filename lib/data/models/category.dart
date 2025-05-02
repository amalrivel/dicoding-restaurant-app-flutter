class Category {
  final String name;

  Category({required this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {"name": String name} => Category(name: name),
      _ => throw const FormatException('Failed to load category.'),
    };
  }

  Map<String, dynamic> toJson() {
    return {'name': name};
  }
}
