import 'package:db_final_project/src/app.dart';
import 'package:db_final_project/src/authors/cubit/authors_cubit.dart';
import 'package:db_final_project/src/books/cubit/books_cubit.dart';
import 'package:db_final_project/src/categories/cubit/categories_cubit.dart';
import 'package:db_final_project/src/layout/cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library Management System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LayoutCubit(),
          ),
          BlocProvider(
            create: (context) => CategoriesCubit()..fetchAllCatigories(),
          ),
          BlocProvider(
            create: (context) => BooksCubit()..fetchAllBooks(),
          ),
          BlocProvider(
            create: (context) => AuthorsCubit()..fetchallAuthors(),
          ),
        ],
        child: const MyHomePage(),
      ),
    );
  }
}
