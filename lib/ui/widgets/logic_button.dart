import 'package:flutter/material.dart';

class LogicButton extends StatelessWidget {
  final int number;
  final Color color;
  const LogicButton({
    super.key,
    required this.number,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        number.toString(),
        style: const TextStyle(
          fontFamily: 'Extrag',
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
