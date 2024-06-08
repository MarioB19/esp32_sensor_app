import 'package:flutter/material.dart';

class DetectionCounter extends StatelessWidget {
  final String label;
  final int count;
  final Color color;

  DetectionCounter(
      {required this.label, required this.count, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$label: $count veces',
      style: TextStyle(fontSize: 16, color: color),
    );
  }
}
