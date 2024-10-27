import 'dart:convert';

import 'package:db_final_project/src/authors/cubit/authors_state.dart';
import 'package:db_final_project/src/models/author.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class AuthorsCubit extends Cubit<AuthorsState> {
  AuthorsCubit() : super(AuthorsInitial());
  static AuthorsCubit get(context) => BlocProvider.of(context);
  List<Author> _allAuthors = [];

  List<Author> get allAuthors => _allAuthors;
  Future<void> fetchallAuthors() async {
    emit(AuthorsFetchAllLoading());
    try {
      final response = await http.get(
          Uri.parse('http://localhost/tech_library_api/authors/get_all.php'));

      if (response.statusCode == 200) {
        // final data = json.decode(response.body);
        // List<dynamic> AuthorJson = data['Autho'];

        // List<Author> Autho =
        //     categoriesJson.map((json) => Author.fromJson(json)).toList();
        // _allAuthors = categories;

        final List<dynamic> authorsJson = json.decode(response.body)['authors'];
        _allAuthors = authorsJson.map((json) => Author.fromJson(json)).toList();

        emit(AuthorsFetchAllSuccess());
      } else {
        emit(AuthorsFetchAllError());
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      emit(AuthorsFetchAllError());
      throw Exception('Error: $e');
    }
  }
}
