import 'package:db_final_project/src/layout/cubit/layout_cubit.dart';
import 'package:db_final_project/src/layout/cubit/layout_state.dart';
import 'package:db_final_project/src/layout/ui/navigation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Library Management System"),
      ),
      body: const Row(
        children: [
          NavigationList(),
          Expanded(
            child: BodyWidget(),
          ),
        ],
      ),
      
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        var cubit = context.read<LayoutCubit>();
        return Container(
          child: cubit.tabs[cubit.currentTab],
        );
      },
    );
  }
}
