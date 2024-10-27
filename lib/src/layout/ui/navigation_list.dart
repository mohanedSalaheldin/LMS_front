import 'package:db_final_project/src/layout/cubit/layout_cubit.dart';
import 'package:db_final_project/src/layout/ui/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/layout_state.dart';

class NavigationList extends StatelessWidget {
  const NavigationList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const spase = SizedBox(
      height: 10,
    );
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Container(
          color: Theme.of(context).colorScheme.onSurface,
          width: 200,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: const EdgeInsets.all(10),
            children: [
              CustomFilledButton(
                isSelected: cubit.currentTab == 0,
                onPressed: () {
                  cubit.changeTab(0);
                },
                text: 'Books',
              ),
              spase,
              CustomFilledButton(
                isSelected: cubit.currentTab == 1,
                onPressed: () {
                  cubit.changeTab(1);
                },
                text: 'Borrows',
              ),
              spase,
              CustomFilledButton(
                isSelected: cubit.currentTab == 2,
                onPressed: () {
                  cubit.changeTab(2);
                },
                text: 'Categories',
              ),
              spase,
              CustomFilledButton(
                isSelected: cubit.currentTab == 3,
                onPressed: () {
                  cubit.changeTab(3);
                },
                text: 'Authers',
              ),
              spase,
            ],
          ),
        );
      },
    );
  }
}
