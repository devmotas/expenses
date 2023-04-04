import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final void Function()? onSubmitted;
  final InputDecoration? decoration;

  AdptativeTextField({
    required this.controller,
    this.keyboardType,
    this.onSubmitted,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTextField(
            controller: controller,
            keyboardType: keyboardType,
            onSubmitted: (_) => onSubmitted?.call(),
            placeholder: decoration?.labelText,
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 6,
            ),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.5,
                  color: CupertinoColors.separator,
                ),
              ),
            ),
          )
        : TextField(
            controller: controller,
            keyboardType: keyboardType,
            onSubmitted: (_) => onSubmitted?.call(),
            decoration: decoration,
          );
  }
}
