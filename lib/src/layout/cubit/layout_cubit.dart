import 'package:db_final_project/src/authors/ui/authors_screen.dart';
import 'package:db_final_project/src/books/ui/books_screen.dart';
import 'package:db_final_project/src/borrows/ui/barrows_screen.dart';
import 'package:db_final_project/src/categories/ui/caregories_screen.dart';
import 'package:db_final_project/src/layout/cubit/layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int _currentTab = 0;
  int get currentTab => _currentTab;
  void changeTab(int tabIndex) {
    _currentTab = tabIndex;
    emit(LayoutChangeTab());
  }

  final List<Widget> _tabs = [
    const BooksScreen(),
    const BorrowsScreen(),
    const CategoriesScreen(),
    const AuthorsScreen(),
  ];

  List<Widget> get tabs => _tabs;
}
