import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawfeer/utils/formatters/formatter.dart';

import '../models/message_model.dart';

class ChatController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final RxList<Message> messages = <Message>[].obs;
  final Rx<DateTime?> visibleDate = Rx<DateTime?>(null);
  final RxBool showFloatingDate = false.obs;
  Timer? _hideTimer;

  @override
  void onInit() {
    super.onInit();
    _loadInitialMessages();
    scrollController.addListener(_handleScroll);
  }

  void _loadInitialMessages() {
    // Your initial messages data
    final List<Map<String, dynamic>> initialMessages = [
      // Today
      {
        'message': 'Perfect, looking forward to it!',
        'timestamp': DateTime.now().subtract(const Duration(minutes: 15)),
        'isSentByMe': false
      },
      {
        'message': 'I\'ll bring the presentation materials',
        'timestamp': DateTime.now().subtract(const Duration(minutes: 16)),
        'isSentByMe': true
      },
      {
        'message': '2 PM works great for me',
        'timestamp': DateTime.now().subtract(const Duration(hours: 1)),
        'isSentByMe': false
      },
      {
        'message': 'How about we meet at 2 PM?',
        'timestamp':
            DateTime.now().subtract(const Duration(hours: 1, minutes: 2)),
        'isSentByMe': true
      },
      {
        'message': 'Yes, we should discuss the new updates',
        'timestamp': DateTime.now().subtract(const Duration(hours: 2)),
        'isSentByMe': false
      },

      // Yesterday
      {
        'message': 'Good night!',
        'timestamp': DateTime.now().subtract(const Duration(days: 1, hours: 1)),
        'isSentByMe': true
      },
      {
        'message': 'I\'ll prepare everything for tomorrow',
        'timestamp': DateTime.now()
            .subtract(const Duration(days: 1, hours: 1, minutes: 1)),
        'isSentByMe': false
      },
      {
        'message': 'Sounds good to me',
        'timestamp': DateTime.now().subtract(const Duration(days: 1, hours: 2)),
        'isSentByMe': true
      },
      {
        'message': 'Can we review it tomorrow?',
        'timestamp': DateTime.now()
            .subtract(const Duration(days: 1, hours: 2, minutes: 1)),
        'isSentByMe': false
      },
      {
        'message': 'I\'ve finished the first draft',
        'timestamp': DateTime.now().subtract(const Duration(days: 1, hours: 4)),
        'isSentByMe': false
      },
      {
        'message': 'How\'s the progress on the report?',
        'timestamp': DateTime.now().subtract(const Duration(days: 1, hours: 6)),
        'isSentByMe': true
      },

      // Last Week - Monday
      {
        'message': 'Have a great evening!',
        'timestamp': DateTime.now().subtract(const Duration(days: 6, hours: 2)),
        'isSentByMe': false
      },
      {
        'message': 'The client loved the presentation',
        'timestamp': DateTime.now().subtract(const Duration(days: 6, hours: 4)),
        'isSentByMe': true
      },
      {
        'message': 'Just finished the meeting',
        'timestamp': DateTime.now()
            .subtract(const Duration(days: 6, hours: 4, minutes: 1)),
        'isSentByMe': true
      },
      {
        'message': 'Good luck with the presentation',
        'timestamp': DateTime.now().subtract(const Duration(days: 6, hours: 8)),
        'isSentByMe': false
      },

      // Last Week - Wednesday
      {
        'message': 'Thanks for the feedback',
        'timestamp': DateTime.now().subtract(const Duration(days: 4, hours: 3)),
        'isSentByMe': true
      },
      {
        'message': 'Those changes look much better',
        'timestamp': DateTime.now()
            .subtract(const Duration(days: 4, hours: 3, minutes: 30)),
        'isSentByMe': false
      },
      {
        'message': 'I\'ve updated the design',
        'timestamp': DateTime.now().subtract(const Duration(days: 4, hours: 5)),
        'isSentByMe': true
      },

      // Two Weeks Ago
      {
        'message': 'Looking forward to next week',
        'timestamp':
            DateTime.now().subtract(const Duration(days: 14, hours: 4)),
        'isSentByMe': false
      },
      {
        'message': 'Great work everyone!',
        'timestamp': DateTime.now()
            .subtract(const Duration(days: 14, hours: 4, minutes: 15)),
        'isSentByMe': true
      },
      {
        'message': 'The sprint review went well',
        'timestamp':
            DateTime.now().subtract(const Duration(days: 14, hours: 5)),
        'isSentByMe': false
      },

      // Last Month
      {
        'message': 'See you next sprint',
        'timestamp':
            DateTime.now().subtract(const Duration(days: 30, hours: 2)),
        'isSentByMe': true
      },
      {
        'message': 'All tasks completed',
        'timestamp': DateTime.now()
            .subtract(const Duration(days: 30, hours: 2, minutes: 30)),
        'isSentByMe': false
      },
      {
        'message': 'Just two more items to go',
        'timestamp':
            DateTime.now().subtract(const Duration(days: 30, hours: 4)),
        'isSentByMe': true
      },
      {
        'message': 'How\'s the sprint going?',
        'timestamp':
            DateTime.now().subtract(const Duration(days: 30, hours: 8)),
        'isSentByMe': false
      },

      // Two Months Ago
      {
        'message': 'The new feature is live',
        'timestamp':
            DateTime.now().subtract(const Duration(days: 60, hours: 3)),
        'isSentByMe': true
      },
      {
        'message': 'Final testing looks good',
        'timestamp':
            DateTime.now().subtract(const Duration(days: 60, hours: 4)),
        'isSentByMe': false
      },
      {
        'message': 'Ready for deployment',
        'timestamp':
            DateTime.now().subtract(const Duration(days: 60, hours: 5)),
        'isSentByMe': true
      },

      // Three Months Ago
      {
        'message': 'Project kickoff went great',
        'timestamp':
            DateTime.now().subtract(const Duration(days: 90, hours: 2)),
        'isSentByMe': false
      },
      {
        'message': 'Looking forward to working together',
        'timestamp':
            DateTime.now().subtract(const Duration(days: 90, hours: 3)),
        'isSentByMe': true
      },
      {
        'message': 'Welcome to the team!',
        'timestamp':
            DateTime.now().subtract(const Duration(days: 90, hours: 4)),
        'isSentByMe': false
      },

      // Six Months Ago
      {
        'message': 'Happy holidays!',
        'timestamp': DateTime(2023, 12, 25, 12, 0),
        'isSentByMe': true
      },
      {
        'message': 'Enjoy your vacation!',
        'timestamp': DateTime(2023, 12, 25, 11, 30),
        'isSentByMe': false
      },

      // Last Year
      {
        'message': 'Happy New Year!',
        'timestamp': DateTime(2023, 1, 1, 0, 0),
        'isSentByMe': false
      },
      {
        'message': 'See you next year!',
        'timestamp': DateTime(2022, 12, 31, 23, 0),
        'isSentByMe': true
      },

      // ... (rest of your messages)
    ];

    messages.value = initialMessages.map(Message.fromJson).toList()
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
  }

  void _handleScroll() {
    if (!scrollController.hasClients) return;

    if (scrollController.position.isScrollingNotifier.value) {
      _updateVisibleDate();
      _showFloatingDateBubble();
    }
  }

  void _updateVisibleDate() {
    if (!scrollController.hasClients) return;

    // Get the current viewport dimensions
    final RenderBox? renderBox = Get.context?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final viewportHeight = renderBox.size.height;
    final scrollOffset = scrollController.offset;

    // Find all items that are currently visible in the viewport
    int? visibleMessageIndex;
    double currentOffset = 0;

    // Estimated height for each message item (adjust based on your actual layout)
    const double estimatedItemHeight =
        50.0; // Adjust this value based on your actual message height
    const double dateDividerHeight =
        30.0; // Adjust based on your date divider height

    // Calculate which message is most visible in the viewport
    for (int i = 0; i < messages.length; i++) {
      final itemTopOffset = currentOffset;
      final itemBottomOffset = currentOffset + estimatedItemHeight;

      // Check if this item is visible in the viewport
      if (itemTopOffset >= scrollOffset &&
          itemTopOffset <= scrollOffset + viewportHeight) {
        // This message is visible at the top of the viewport
        visibleMessageIndex = i;
        break;
      }

      // Add height for the message
      currentOffset += estimatedItemHeight;

      // Add height for date divider if needed
      if (i < messages.length - 1 &&
          !TFormatter.isSameDay(
              messages[i].timestamp, messages[i + 1].timestamp)) {
        currentOffset += dateDividerHeight;
      }
    }

    // Update the visible date if we found a visible message
    if (visibleMessageIndex != null && visibleMessageIndex < messages.length) {
      final newVisibleDate = messages[visibleMessageIndex].timestamp;
      if (visibleDate.value?.day != newVisibleDate.day ||
          visibleDate.value?.month != newVisibleDate.month ||
          visibleDate.value?.year != newVisibleDate.year) {
        visibleDate.value = newVisibleDate;
      }
    }
  }

  void _showFloatingDateBubble() {
    showFloatingDate.value = true;

    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 2), () {
      showFloatingDate.value = false;
    });
  }

  void sendMessage(String messageText) {
    final newMessage = Message(
      message: messageText,
      timestamp: DateTime.now(),
      isSentByMe: true,
      isRead: false,
    );

    messages.insert(0, newMessage); // Add to beginning of the list

    // Optional: Scroll to the new message
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void handleImageSelection() {
    // Implement image picker logic here
    // Example:
    // final ImagePicker _picker = ImagePicker();
    // final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    // if (image != null) {
    //   // Handle the selected image
    // }
  }

  @override
  void onClose() {
    _hideTimer?.cancel();
    scrollController.dispose();
    super.onClose();
  }
}
