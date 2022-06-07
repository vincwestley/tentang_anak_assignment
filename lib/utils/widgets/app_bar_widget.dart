import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;

  AppBarWidget({Key? key, required this.title})
      : preferredSize = Size.fromHeight(AppBar().preferredSize.height),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
    );
  }
}
