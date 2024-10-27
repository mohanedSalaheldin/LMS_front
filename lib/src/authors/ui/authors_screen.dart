import 'package:db_final_project/src/authors/cubit/authors_cubit.dart';
import 'package:db_final_project/src/authors/cubit/authors_state.dart';
import 'package:db_final_project/src/categories/ui/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorsScreen extends StatelessWidget {
  const AuthorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: buildAddButton(context),
      body: BlocBuilder<AuthorsCubit, AuthorsState>(
        builder: (context, state) {
          var cubit = AuthorsCubit.get(context);
          if (state is AuthorsFetchAllLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AuthorsFetchAllError) {
            return const Center(
              child: Text('Error'),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: ListView.separated(
              itemBuilder: (context, index) => CustomListTile(
                leading: cubit.allAuthors[index].authorId.toString(),
                title: cubit.allAuthors[index].authorName,
                subtitle: cubit.allAuthors[index].authorBio,
                deleteOnPressed: () {},
                editOnPressed: () {},
              ),
              separatorBuilder: (context, index) => const SizedBox(),
              itemCount: cubit.allAuthors.length,
            ),
          );
        },
      ),
    );
  }
}
