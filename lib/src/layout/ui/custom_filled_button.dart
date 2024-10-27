import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isSelected = false,
  });
  final String text;
  final void Function() onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: isSelected
          ? null
          : ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.grey[200]),
              foregroundColor: const WidgetStatePropertyAll(Colors.black),
            ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
