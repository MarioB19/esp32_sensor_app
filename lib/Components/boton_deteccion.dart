import 'package:flutter/material.dart';

class SensorSwitch extends StatelessWidget {
  final String label;
  final bool isActive;
  final Color color;

  SensorSwitch({required this.label, required this.isActive, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        Switch(
          value: isActive,
          onChanged: (value) {},
          activeColor: color,
        ),
        Text(
          isActive ? 'Objeto detectado' : 'No se detectó objeto',
          style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7)),
        ),
      ],
    );
  }
}