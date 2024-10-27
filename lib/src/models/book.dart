class Book {
  final int bookId;
  final String title;
  final int authorId;
  final String programmingLanguage;
  final int categoryId;
  final double price;
  final String publishedYear;

  Book({
    required this.bookId,
    required this.title,
    required this.authorId,
    required this.programmingLanguage,
    required this.categoryId,
    required this.price,
    required this.publishedYear,
  });

  // Factory method to create a Book from JSON
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      bookId: json['Book_ID'],
      title: json['Title'],
      authorId: json['Author_ID'],
      programmingLanguage: json['Programming_Language'],
      categoryId: json['Category_ID'],
      price: double.parse(json['Price']),
      publishedYear: json['Published_Year'],
    );
  }
}
