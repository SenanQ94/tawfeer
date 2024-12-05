import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../controllers/chat_controller.dart';

class TMessageInputField extends StatelessWidget {
  TMessageInputField({super.key});

  final TextEditingController textController = TextEditingController();
  final ChatController chatController = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Iconsax.image1, color: Colors.grey),
            onPressed: () => chatController.handleImageSelection(),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
          ),
          Expanded(
            child: TextField(
              controller: textController,
              maxLines: 4,
              minLines: 1,
              decoration: InputDecoration(
                hintText: "Type a message",
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                filled: true,
              ),
              onSubmitted: (text) {
                if (text.isNotEmpty) {
                  _sendMessage();
                }
              },
            ),
          ),
          IconButton(
            icon: const Icon(Iconsax.send_1, color: Colors.green),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    if (textController.text.isNotEmpty) {
      chatController.sendMessage(textController.text);
      textController.clear();
    }
  }
}
