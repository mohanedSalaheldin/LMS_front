class Category {
  final int id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  // Factory constructor to create a Category object from JSON
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['Category_ID'],
      name: json['Category_Name'],
    );
  }
}
