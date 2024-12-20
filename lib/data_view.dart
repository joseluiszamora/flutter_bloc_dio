import 'package:flutter/material.dart';

class DataView extends StatelessWidget {
  final dynamic data;

  const DataView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Text(data.toString());
  }
}
