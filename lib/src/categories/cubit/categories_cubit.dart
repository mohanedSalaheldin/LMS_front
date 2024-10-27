import 'dart:convert';

import 'package:db_final_project/src/categories/cubit/categories_state.dart';
import 'package:db_final_project/src/models/category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  static CategoriesCubit get(context) => BlocProvider.of(context);
  List<Category> _allCatigories = [];

  List<Category> get allCatigories => _allCatigories;
  Future<void> fetchAllCatigories() async {
    emit(CategoriesFetchAllLoading());
    try {
      final response = await http.get(Uri.parse(
          'http://localhost/tech_library_api/categories/get_all.php'));

      if (response.statusCode == 200) {
     
        final data = json.decode(response.body);
        List<dynamic> categoriesJson = data['categories'];

        List<Category> categories =
            categoriesJson.map((json) => Category.fromJson(json)).toList();
        _allCatigories = categories;

        emit(CategoriesFetchAllSuccess());
      } else {
        emit(CategoriesFetchAllError());
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      emit(CategoriesFetchAllError());
      throw Exception('Error: $e');
    }
  }
}

