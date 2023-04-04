import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;

  AdaptativeButton({
    required this.label,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: onPressed,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(label,
                style: TextStyle(
                  color: Theme.of(context).textTheme.labelLarge?.color,
                )))
        : ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.purple),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white)),
            onPressed: onPressed,
            child: Text(label),
          );
  }
}
