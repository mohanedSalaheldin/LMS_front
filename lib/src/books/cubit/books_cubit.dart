import 'dart:convert';

import 'package:db_final_project/src/books/cubit/books_state.dart';
import 'package:db_final_project/src/models/book.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class BooksCubit extends Cubit<BooksState> {
  BooksCubit() : super(BooksInitial());

  static BooksCubit get(context) => BlocProvider.of(context);
  List<Book> _allBooks = [];

  List<Book> get allBooks => _allBooks;
  Future<void> fetchAllBooks() async {
    emit(BooksFetchAllLoading());
    try {
      final response = await http.get(
          Uri.parse('http://localhost/tech_library_api/books/get_all.php'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<dynamic> categoriesJson = data['books'];

        List<Book> books =
            categoriesJson.map((json) => Book.fromJson(json)).toList();
        _allBooks = books;

        emit(BooksFetchAllSuccess());
      } else {
        emit(BooksFetchAllError());
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      emit(BooksFetchAllError());
      throw Exception('Error: $e');
    }
  }

  Future<void> removeBook(int bookID) async {
    emit(BooksFetchAllLoading());
    Future.delayed(
      const Duration(seconds: 3),
      () {},
    );
    Book book = _allBooks
        .where(
          (element) => element.bookId == bookID,
        )
        .first;

    _allBooks.remove(book);

    emit(BooksRemoveSuccess());
  }

  Future<void> addBook(Book book) async {
    _allBooks.add(book);
    emit(BooksAddNewError());
  }
}
