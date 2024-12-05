import 'package:flutter/material.dart';
import 'package:tawfeer/features/chat/controllers/chat_controller.dart';
import 'package:tawfeer/utils/formatters/formatter.dart';

class TFloatingDateBubble extends StatelessWidget {
  const TFloatingDateBubble({
    super.key,
    required this.controller,
  });

  final ChatController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        opacity: controller.showFloatingDate.value ? 1.0 : 0.0,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 200),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 6.0,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            TFormatter.getFormattedChatDate(
              controller.visibleDate.value!,
            ),
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }
}
