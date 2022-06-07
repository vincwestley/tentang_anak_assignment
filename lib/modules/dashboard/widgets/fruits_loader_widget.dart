import 'package:flutter/material.dart';

class FruitsLoaderWidget extends StatelessWidget {
  const FruitsLoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
