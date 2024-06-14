import 'package:flutter/material.dart';

AppBar ThemedAppBar(String title, [List<Widget>? actionIcons]) {
  return AppBar(
    title: Text(title),
    actions: actionIcons,
  );
}