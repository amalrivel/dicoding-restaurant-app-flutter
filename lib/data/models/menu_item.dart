class MenuItem {
  final String name;

  MenuItem({required this.name});

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {"name": String name} => MenuItem(name: name),
      _ => throw const FormatException('Failed to load menu item.'),
    };
  }

  Map<String, dynamic> toJson() {
    return {'name': name};
  }
}
