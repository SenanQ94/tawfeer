import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawfeer/common/widgets/appbar/appbar.dart';
import 'package:tawfeer/features/chat/screens/widgets/floating_date_bubble.dart';
import 'package:tawfeer/utils/formatters/formatter.dart';

import '../controllers/chat_controller.dart';
import 'widgets/chat_bubble.dart';
import 'widgets/date_bubble.dart';
import 'widgets/message_input_field.dart';

class ChatDetailScreen extends StatelessWidget {
  ChatDetailScreen({super.key, required this.userName});

  final String userName;
  final ChatController controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          userName,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    controller: controller.scrollController,
                    reverse: true,
                    padding: const EdgeInsets.all(10.0),
                    itemCount: controller.messages.length,
                    itemBuilder: (context, index) {
                      final message = controller.messages[index];
                      final currentTimestamp = message.timestamp;

                      bool showDateDivider = false;
                      if (index == controller.messages.length - 1 ||
                          !TFormatter.isSameDay(
                            currentTimestamp,
                            controller.messages[index + 1].timestamp,
                          )) {
                        showDateDivider = true;
                      }

                      return Column(
                        children: [
                          if (showDateDivider)
                            TDateBubble(date: currentTimestamp),
                          TChatBubble(
                            message: message.message,
                            timestamp: currentTimestamp,
                            isSentByMe: message.isSentByMe,
                            isRead: index < 3,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              const Divider(height: 1),
              TMessageInputField(),
            ],
          ),
          Obx(() {
            if (controller.showFloatingDate.value &&
                controller.visibleDate.value != null) {
              return Positioned(
                top: 18,
                left: 0,
                right: 0,
                child: TFloatingDateBubble(controller: controller),
              );
            }
            return const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
