import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawfeer/common/widgets/appbar/appbar.dart';
import 'package:tawfeer/common/widgets/list_tiles/chat_list_tile.dart';
import 'package:tawfeer/features/chat/screens/chat_details.dart';
import 'package:tawfeer/utils/constants/sizes.dart';

class ChatsListScreen extends StatelessWidget {
  const ChatsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Define a list of chats with different data
    final List<Map<String, String>> chats = [
      {
        'userName': 'Sinan Qarhiely',
        'lastMessage': 'Hello, how are you?',
        'lastMessageTime': '12:30 PM',
      },
      {
        'userName': 'Alex Smith',
        'lastMessage': 'Meeting tomorrow?',
        'lastMessageTime': '9:15 AM',
      },
      {
        'userName': 'John Doe',
        'lastMessage': 'Thanks for the update!',
        'lastMessageTime': '3:45 PM',
      },
      {
        'userName': 'Jane Williams',
        'lastMessage': 'Let\'s catch up soon.',
        'lastMessageTime': '8:00 PM',
      },
    ];

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: false,
        centerTitle: true,
        title: Text(
          'Chats',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          // Get the data for each chat
          final chat = chats[index];
          return Column(
            children: [
              TChatListTile(
                userName: chat['userName']!,
                lastMessage: chat['lastMessage']!,
                lastMessageTime: chat['lastMessageTime']!,
                onTap: () =>
                    Get.to(() => ChatDetailScreen(userName: chat['userName']!)),
              ),
              const Divider(
                indent: TSizes.sm,
                endIndent: TSizes.sm,
                thickness: 0.2,
              ),
            ],
          );
        },
      ),
    );
  }
}
