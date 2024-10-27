import 'package:db_final_project/src/categories/cubit/categories_cubit.dart';
import 'package:db_final_project/src/categories/cubit/categories_state.dart';
import 'package:db_final_project/src/categories/ui/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final _formKey = GlobalKey<FormState>();

  // TextEditingControllers for form fields
  final TextEditingController _field1Controller = TextEditingController();
  final TextEditingController _field2Controller = TextEditingController();

  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed
    _field1Controller.dispose();
    _field2Controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buildAddButton(context),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          var cubit = CategoriesCubit.get(context);
          if (state is CategoriesFetchAllLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategoriesFetchAllError) {
            return const Center(
              child: Text('Error'),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: ListView.separated(
              itemBuilder: (context, index) => CustomListTile(
                leading: cubit.allCatigories[index].id.toString(),
                title: cubit.allCatigories[index].name,
                deleteOnPressed: () {},
                editOnPressed: () {},
              ),
              separatorBuilder: (context, index) => const SizedBox(),
              itemCount: cubit.allCatigories.length,
            ),
          );
        },
      ),
    );
  }

  FloatingActionButton buildAddButton(context) {
    return FloatingActionButton(
      onPressed: () {
        // cubit.fetchAllCatigories();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('New Category'),
              content: Form(
                key: _formKey,
                child: const Column(
                  mainAxisSize: MainAxisSize.min, // Wrap content size
                  children: [
                    // CustomTextForm(controller: _field1Controller),

                    // const SizedBox(height: 10),

                    // CustomTextForm(controller: _field2Controller),
                    // const SizedBox(height: 10),
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
