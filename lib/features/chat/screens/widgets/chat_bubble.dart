import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tawfeer/utils/constants/colors.dart';
import 'package:tawfeer/utils/device/device_utility.dart';

class TChatBubble extends StatelessWidget {
  const TChatBubble({
    super.key,
    required this.message,
    required this.timestamp,
    required this.isSentByMe,
    required this.isRead,
  });

  final String message;
  final DateTime timestamp;
  final bool isSentByMe;
  final bool isRead;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        mainAxisAlignment:
            isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: TDeviceUtils.getScreenWidth(context) * 0.75,
            ),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: isSentByMe ? TColors.primary : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  message,
                  style: TextStyle(
                    color: isSentByMe ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      DateFormat('hh:mm a').format(timestamp),
                      style: TextStyle(
                        fontSize: 10,
                        color: isSentByMe ? Colors.white70 : Colors.black54,
                      ),
                    ),
                    if (isSentByMe) ...[
                      const SizedBox(width: 3),
                      Icon(
                        isRead ? Icons.done_all : Icons.done,
                        color: isRead ? Colors.blue : Colors.white70,
                        size: 14,
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
