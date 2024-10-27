class Author {
  final int authorId;
  final String authorName;
  final String authorBio;

  Author({
    required this.authorId,
    required this.authorName,
    required this.authorBio,
  });

  // Factory method to create an Author from JSON
  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      authorId: json['Author_ID'],
      authorName: json['Author_Name'],
      authorBio: json['Author_Bio'],
    );
  }
}
