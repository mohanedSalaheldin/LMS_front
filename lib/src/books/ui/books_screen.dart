import 'package:db_final_project/src/books/cubit/books_cubit.dart';
import 'package:db_final_project/src/books/cubit/books_state.dart';
import 'package:db_final_project/src/categories/ui/widgets/custom_list_tile.dart';
import 'package:db_final_project/src/categories/ui/widgets/custom_text_form.dart';
import 'package:db_final_project/src/models/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  final _formKey = GlobalKey<FormState>();

  // TextEditingControllers for form fields
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _programmingLanguageController =
      TextEditingController();

  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed
    _titleController.dispose();
    _dateController.dispose();
    _priceController.dispose();
    _programmingLanguageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buildAddButton(context),
      body: BlocBuilder<BooksCubit, BooksState>(
        builder: (context, state) {
          var cubit = BooksCubit.get(context);
          if (state is BooksFetchAllLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is BooksFetchAllError) {
            return const Center(
              child: Text('Error'),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: ListView.separated(
              itemBuilder: (context, index) => CustomListTile(
                leading: cubit.allBooks[index].bookId.toString(),
                title: cubit.allBooks[index].title,
                subtitle: cubit.allBooks[index].programmingLanguage,
                deleteOnPressed: () {
                  cubit.removeBook(cubit.allBooks[index].bookId);
                },
                editOnPressed: () {},
              ),
              separatorBuilder: (context, index) => const SizedBox(),
              itemCount: cubit.allBooks.length,
            ),
          );
        },
      ),
    );
  }

  FloatingActionButton buildAddButton(context) {
    var cubit = BooksCubit.get(context);
    return FloatingActionButton(
      onPressed: () {
        // cubit.fetchAllCatigories();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('New Book'),
              content: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Wrap content size
                  children: [
                    CustomTextForm(
                      controller: _titleController,
                      labelText: 'Title',
                    ),
                    const SizedBox(height: 10),
                    CustomTextForm(
                      controller: _programmingLanguageController,
                      labelText: 'Language',
                    ),
                    const SizedBox(height: 10),
                    CustomTextForm(
                      controller: _dateController,
                      labelText: 'Publish Date',
                    ),
                    const SizedBox(height: 10),
                    CustomTextForm(
                      controller: _priceController,
                      labelText: 'Price',
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      cubit.addBook(Book(
                          bookId: 7,
                          title: _titleController.text,
                          authorId: 1,
                          programmingLanguage:
                              _programmingLanguageController.text,
                          categoryId: 2,
                          price: double.parse(_priceController.text),
                          publishedYear: _dateController.text));
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            );
          },
        );
      },
      tooltip: 'Add',
      child: const Icon(Icons.add),
    );
  }
}
