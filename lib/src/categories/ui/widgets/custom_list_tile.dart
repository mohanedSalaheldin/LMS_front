import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.leading,
    required this.title,
    required this.deleteOnPressed,
    this.subtitle,
    required this.editOnPressed,
  });
  final String leading;
  final String title;
  final String? subtitle;
  final void Function() deleteOnPressed;
  final void Function() editOnPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: CircleAvatar(child: Text(leading)),
        subtitle: Text(subtitle ?? ''),
        title: Text(title),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: [
              IconButton(
                onPressed: editOnPressed,
                icon: const Icon(
                  Icons.edit,
                  color: Colors.grey,
                ),
              ),
              IconButton(
                onPressed: deleteOnPressed,
                icon: const Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
