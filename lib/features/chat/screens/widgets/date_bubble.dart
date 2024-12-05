import 'package:flutter/material.dart';
import 'package:tawfeer/utils/formatters/formatter.dart';

class TDateBubble extends StatelessWidget {
  const TDateBubble({
    super.key,
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          TFormatter.getFormattedChatDate(date),
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
